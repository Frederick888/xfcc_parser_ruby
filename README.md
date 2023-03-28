# XfccParserRuby

Wrapper of Envoy [`x-forwarded-client-cert`][1] (XFCC) header parser [`xfcc-parser`][2].

## Installation

First download the [Rust][3] toolchain >= 1.56.0 if you would like to install the source gem.

Then install the gem and add to the application's Gemfile by executing:

    $ bundle add xfcc_parser_ruby

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install xfcc_parser_ruby

Note that some distributions have different names for `libruby`, and if you've installed the gems with bundled binaries, you'll see errors like `libruby.so.3.0: cannot open shared object file: No such file or directory` when you load the library.

In this case, you can either link the `libruby` shared library to `libruby.[so|dylib|dll].[<version>]`, so simply install the source gem instead.

## Usage

```ruby
require "xfcc_parser_ruby"

XfccParserRuby::Parser.element_list("By=http://example.com;URI=http://test.com")
```

## Development

First make sure you've installed the [Rust][3] toolchain >= 1.56.0.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Frederick888/xfcc_parser_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Frederick888/xfcc_parser_ruby/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the XfccParserRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Frederick888/xfcc_parser_ruby/blob/master/CODE_OF_CONDUCT.md).

[1]: https://www.envoyproxy.io/docs/envoy/latest/configuration/http/http_conn_man/headers#x-forwarded-client-cert
[2]: https://github.com/Frederick888/xfcc-parser
[3]: https://www.rust-lang.org/tools/install
