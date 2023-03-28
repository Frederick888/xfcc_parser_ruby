set shell := ["bash", "+u", "-c"]

default:
    bundle install
    bundle exec rake

test:
    bundle exec rake test

build:
    bundle exec rake build

clean:
    git clean -dfx -- lib pkg/* tmp

release version:
    set -e
    @if [[ "{{version}}" == v* ]]; then printf 'Must not have v-prefix\n'; exit 1; fi
    # changelog
    if [[ "{{version}}" != *"-"* ]]; then \
        last_tag="$(git tag -l --sort version:refname | grep -v -- - | tail -n1)"; \
        clog --from="$last_tag" --setversion=v{{version}} -o ./CHANGELOG.md; \
        git add ./CHANGELOG.md; \
    fi
    # rust
    sed 's/^version = ".*"$/version = "{{version}}"/' -i ./Cargo.toml
    git add ./Cargo.toml
    # ruby
    sed 's/VERSION = ".*"$/VERSION = "{{version}}"/' -i ./lib/xfcc_parser_ruby/version.rb
    # update lock files and test
    just
    git add ./Cargo.lock ./Gemfile.lock ./lib/xfcc_parser_ruby/version.rb
    # commit and tag
    git status
    git diff --exit-code
    git commit -m 'chore: Bump version to {{version}}'
    git tag v{{version}}

# vim: set filetype=just :
