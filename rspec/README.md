# cookiecutter-ruby

## Install pre-requisite software

First, ensure [cookiecutter](https://cookiecutter.readthedocs.io/en/1.7.0/installation.html) is installed.

Then ensure the following are installed: [direnv](https://direnv.net), [chruby](https://github.com/postmodern/chruby), and [ruby-install](https://github.com/postmodern/ruby-install) OR [RVM (Ruby Version Manager)](https://rvm.io/rvm/install).  For example:

```bash
$> brew install direnv
$> brew install chruby
$> brew install ruby-install
```

Install a ruby version--if it isn't already present.  For example:

```bash
$> ruby-install ruby-2.6.6
```

Ensure your ``.zshrc`` contains the ``use_ruby()`` method defined in the appendix.

## Setup a new cookiecutter-ruby template

For example, create a new cookiecutter-ruby template in a directory called ``myapp``

```bash
➜  DUMP cookiecutter $COOKIE/cookiecutter-ruby
dir_name [.]: myapp
```

This will create the following structure:

```bash
➜  DUMP tree -a myapp
myapp
├── .envrc
├── .gitignore
├── .ruby-version
├── Gemfile
├── Rakefile

0 directories, 6 files
➜  DUMP
```

where

- .ruby-version contains the ruby version to be used
- .envrc contains environment setting, e.g., the 'use_ruby' and some PATH_add statements
- ./bin contains useful scripts.  For example, setup is a script here that sets everything up, installing bundle locally, installing the gems, etc
- .env/bin contains useful aliases like 'bera' for 'bundle exec rake'
- Gemfile contains all the necessary gems for useful work, debugging, testing with inspec
- Rakefile is a best practice starting point that should be recrafted to suit your present need.

## Initialize the new ruby environment

cd into the ``myapp`` directory and allow direnv to configure the environment:

```bash
➜  DUMP cd myapp
direnv: error /Users/gavindidrichsen/DUMP/myapp/.envrc is blocked. Run `direnv allow` to approve its content
Required ruby-2.6.6 is not installed.
To install do: 'rvm install "ruby-2.6.6"'
➜  myapp direnv allow
direnv: loading ~/DUMP/myapp/.envrc
direnv: export +BUNDLE_BIN +GEM_ROOT +RUBYOPT +RUBY_ENGINE +RUBY_ROOT ~GEM_HOME ~GEM_PATH ~PATH ~RUBY_VERSION
```

Run ``setup`` which installs bundle and a sample gem.  ``setup`` is on the PATH now because of the .envrc and lives in the ./bin directory.

```bash
➜  myapp setup

__dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
+++ dirname /Users/gavindidrichsen/DUMP/myapp/bin/setup
++ cd /Users/gavindidrichsen/DUMP/myapp/bin
++ pwd
+ __dir=/Users/gavindidrichsen/DUMP/myapp/bin

# configure bundle
bundle config set path "${__dir}/vendor/bundle"
+ bundle config set path /Users/gavindidrichsen/DUMP/myapp/bin/vendor/bundle
You are replacing the current global value of set, which is currently "path /Users/gavindidrichsen/DUMP/mygem/bin/vendor/bundle"
bundle install
+ bundle install
fatal: not a git repository (or any of the parent directories): .git
Fetching gem metadata from https://rubygems.org/..........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Fetching rake 13.0.1
Installing rake 13.0.1
...
...
Using myapp 0.1.0 from source at `.`
...
...
Bundle complete! 11 Gemfile dependencies, 40 gems now installed.
Bundled gems are installed into `./vendor/bundle`

# Do any other automated setup that you need to do here
➜  myapp
```

The ``myapp`` directory is now a ready-to-use ruby environment.  

## Testing

Some example rspec tests have been included to help get started.  Either run the tests manually using rspec or rake, or automatically via guard.  For these actions, 3 aliases are particularly useful (and located in the .env/bin direvtory along with others):

* bers for bundle exec rspec
* bera for bundle exec rake
* begc for bundle exec guard --clear

bers will produce something like:

```bash
➜  myapp bers spec
fatal: not a git repository (or any of the parent directories): .git

Quarterback
  should be able to throw

Runner
  should be able to run

myapp
  has a version number
  should be a runner
  should be a quarterback

Finished in 0.00287 seconds (files took 0.10718 seconds to load)
5 examples, 0 failures

➜  myapp
```

bera spec will produce something like:

```bash
➜  myapp bera spec
/Users/gavindidrichsen/.rubies/ruby-2.6.6/bin/ruby -I/Users/gavindidrichsen/DUMP/myapp/vendor/bundle/gems/rspec-core-3.9.2/lib:/Users/gavindidrichsen/DUMP/myapp/vendor/bundle/gems/rspec-support-3.9.3/lib /Users/gavindidrichsen/DUMP/myapp/vendor/bundle/gems/rspec-core-3.9.2/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb --color --format progress
.....

Finished in 0.0027 seconds (files took 0.10568 seconds to load)
5 examples, 0 failures

➜  myapp
```

begc will startup a guard process for continuous test driven development.  For example:

```bash
➜  myapp begc

11:25:10 - INFO - Guard::RSpec is running
11:25:10 - INFO - Guard is now watching at '/Users/gavindidrichsen/DUMP/myapp'
[1] guard(main)>
```

## References

1. [Chef Newstart Guide for Ruby](https://github.com/chef-partners/newcrew/blob/master/setup/ruby.md#mac-os-or-linux):

# Appendicies

## use_ruby()

Configure your ``.zshrc`` adding the following:

```bash
use_ruby() {
  source /usr/local/share/chruby/chruby.sh

  local ver=$1
  if [[ -z $ver ]] && [[ -f .ruby-version ]]; then
    ver=$(cat .ruby-version)
  fi
  if [[ -z $ver ]]; then
    echo Unknown ruby version
    exit 1
  fi

  # switch to the desired ruby
  chruby $ver

  # Sets the GEM_HOME environment variable to `$PWD/.direnv/ruby/RUBY_VERSION`.
  # This forces the installation of any gems into the project’s sub-folder. If
  # you’re using bundler it will create wrapper programs that can be invoked
  # directly instead of using the `bundle exec` prefix.
  layout_ruby
}
```
