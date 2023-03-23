# frozen_string_literal: true

require "test_helper"

module XfccParserRuby
  class TestXfccParserRuby < Minitest::Test
    def test_basic_single_element_xfcc
      xfcc = 'By=http://frontend.lyft.com;Hash=468ed33be74eee6556d90c0149c1309e9ba61d6425303443c0748a02dd8de688;Subject="/C=US/ST=CA/L=San Francisco/OU=Lyft/CN=Test Client";URI=http://testclient.lyft.com'
      # @type [Array<XfccParserRuby::Element>]
      elements = Parser.element_list(xfcc)
      assert_equal 1, elements.size
      element = elements[0]
      assert_equal ["http://frontend.lyft.com"], element.by
      assert_equal "468ed33be74eee6556d90c0149c1309e9ba61d6425303443c0748a02dd8de688", element.hash
      assert element.cert.nil?
      assert element.chain.nil?
      assert_equal "/C=US/ST=CA/L=San Francisco/OU=Lyft/CN=Test Client", element.subject
      assert_equal ["http://testclient.lyft.com"], element.uri
      assert_equal [], element.dns
    end

    def test_invalid_element_key
      xfcc = "By=http://example.com;Foo=bar"
      exception = assert_raises XfccError do
        Parser.element_list(xfcc)
      end
      assert_equal "Trailing sequence #{";Foo=bar".bytes.to_s}", exception.message
    end

    def test_duplicate_key
      xfcc = "By=http://example.com;Hash=1234;Hash=4321"
      exception = assert_raises XfccError do
        Parser.element_list(xfcc)
      end
      assert_equal "Duplicate pair key Hash", exception.message
    end
  end
end
