# {{cookiecutter.dir_name}}

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/{{cookiecutter.dir_name}}`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem '{{cookiecutter.dir_name}}'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install {{cookiecutter.dir_name}}

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

To run all the rspec tests either use rake or run rspec directly.  For example, running rake spec will produce output similar to the following:

```bash
➜  {{cookiecutter.dir_name}} git:(master) ✗ bundle exec rspec

{{cookiecutter.dir_name | capitalize}}
  has a version number
  does something useful

Finished in 0.00232 seconds (files took 0.09891 seconds to load)
2 examples, 0 failures

➜  {{cookiecutter.dir_name}} git:(master) ✗
```

Running the rake spec produces a more terse output:

```bash
➜  {{cookiecutter.dir_name}} git:(master) ✗ bundle exec rake spec
/Users/gavindidrichsen/.rubies/ruby-2.6.6/bin/ruby -I/Users/gavindidrichsen/Documents/@REFERENCE/ruby/scripts/gem/{{cookiecutter.dir_name}}/vendor/bundle/gems/rspec-core-3.9.2/lib:/Users/gavindidrichsen/Documents/@REFERENCE/ruby/scripts/gem/{{cookiecutter.dir_name}}/vendor/bundle/gems/rspec-support-3.9.3/lib /Users/gavindidrichsen/Documents/@REFERENCE/ruby/scripts/gem/{{cookiecutter.dir_name}}/vendor/bundle/gems/rspec-core-3.9.2/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb --color --format progress
..

Finished in 0.00207 seconds (files took 0.09703 seconds to load)
2 examples, 0 failures

➜  {{cookiecutter.dir_name}} git:(master) ✗
```

Use guard to run the tests continuously as follows:

```bash
bundle exec guard
# or 'beg' alias
```

The set-up of the `Guardfile` is very specific to the directory structure you
have.

Add any alias commands as a shell script to the .env/bin directory.  For example ``beie`` equals:

```bash
#!/usr/bin/env bash

bundle exec inspec exec "${@}"
```

A typical structure is to have `lib` and `spec` folders. That's what our
`Guardfile` is based on.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/{{cookiecutter.dir_name}}. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Example project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/{{cookiecutter.dir_name}}/blob/master/CODE_OF_CONDUCT.md).
