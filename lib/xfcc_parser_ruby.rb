# frozen_string_literal: true

require_relative "xfcc_parser_ruby/version"
require "rutie"

# Envoy x-forwarded-client-cert (XFCC) parser
module XfccParserRuby
  class XfccError < ::StandardError; end

  # An XFCC element containing info of a client certificate
  class Element
    attr_accessor :by, :hash, :cert, :chain, :subject, :uri, :dns

    def initialize(*args)
      @by, @hash, @cert, @chain, @subject, @uri, @dns = args
    end
  end

  Rutie.new(:xfcc_parser_ruby,
            lib_prefix: "",
            lib_path: "../lib",
            lib_suffix: RbConfig::CONFIG["DLEXT"]).init "Init_xfcc_parser_ruby", __dir__
end
