# XfccParserRuby

Wrapper of Envoy [`x-forwarded-client-cert`][1] (XFCC) header parser [`xfcc-parser`][2].

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

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
