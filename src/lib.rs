use std::borrow::{Borrow, Cow};

use rutie::types::Value;
use rutie::{
    class, methods, AnyException, AnyObject, Array, Class, Exception, Module, NilClass, Object,
    RString, VerifiedObject, VM,
};

class!(Parser);

methods!(
    Parser,
    _rtself,
    fn pub_element_list(input: RString) -> Array {
        let ruby_string = input.map_err(VM::raise_ex).unwrap();

        let elements = xfcc_parser::element_list(ruby_string.to_str().as_bytes())
            .map_err(|e| AnyException::new("XfccParserRuby::XfccError", Some(&e.to_string())))
            .map_err(VM::raise_ex)
            .unwrap();
        let mut result: Array = Array::new();
        for element in elements.iter() {
            result.push(Element::new(element).to_any_object());
        }

        result
    }
);

pub struct Element {
    value: Value,
}

impl Element {
    pub fn new(rust_element: &xfcc_parser::Element) -> Self {
        let by = Self::to_ruby_array(&rust_element.by);
        let hash = Self::to_ruby_string(&rust_element.hash);
        let cert = Self::to_ruby_string(&rust_element.cert);
        let chain = Self::to_ruby_string(&rust_element.chain);
        let subject = Self::to_ruby_string(&rust_element.subject);
        let uri = Self::to_ruby_array(&rust_element.uri);
        let dns = Self::to_ruby_array(&rust_element.dns);

        let arguments = [by, hash, cert, chain, subject, uri, dns];

        let instance = Class::from_existing("XfccParserRuby")
            .get_nested_class("Element")
            .new_instance(&arguments);

        Self {
            value: instance.value(),
        }
    }

    pub fn to_any_object(&self) -> AnyObject {
        AnyObject::from(self.value())
    }

    fn to_ruby_array(value: &[Cow<str>]) -> AnyObject {
        value
            .iter()
            .map(|s| RString::new_utf8(s).to_any_object())
            .collect::<Array>()
            .to_any_object()
    }

    fn to_ruby_string(value: &Option<Cow<str>>) -> AnyObject {
        match value {
            Some(s) => RString::new_utf8(s.borrow()).to_any_object(),
            None => NilClass::new().to_any_object(),
        }
    }
}

impl From<Value> for Element {
    fn from(value: Value) -> Self {
        Self { value }
    }
}

impl Object for Element {
    #[inline]
    fn value(&self) -> Value {
        self.value
    }
}

impl VerifiedObject for Element {
    fn is_correct_type<T: Object>(object: &T) -> bool {
        Class::from_existing("Element").case_equals(object)
    }

    fn error_message() -> &'static str {
        "Error converting to Element"
    }
}

#[allow(non_snake_case)]
#[no_mangle]
pub extern "C" fn Init_xfcc_parser_ruby() {
    Module::from_existing("XfccParserRuby")
        .define_nested_class("Parser", None)
        .define(|klass| {
            klass.def_self("element_list", pub_element_list);
        });
}
