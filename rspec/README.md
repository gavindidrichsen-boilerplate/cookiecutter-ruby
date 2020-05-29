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
$> ruby-install ruby-2.7.1
```

Ensure your ``.zshrc`` contains the ``use_ruby()`` method defined in the appendix.

## Setup a new cookiecutter-ruby template

For example, create a new cookiecutter-ruby template in a directory called ``stuff4``

```bash
➜  DUMP cookiecutter $COOKIE/cookiecutter-ruby
dir_name [.]: stuff4
```

This will create the following structure:

```bash
➜  DUMP tree -a stuff4
stuff4
├── .envrc
├── .gitignore
├── .ruby-version
├── Gemfile
├── Rakefile
└── setup.sh

0 directories, 6 files
➜  DUMP
```

where

- .ruby-version contains the ruby version to be used
- .envrc contains environment setting, e.g., the 'use_ruby' and some useful aliases
- Gemfile contains all the necessary gems for useful work, debugging, testing with inspec
- Rakefile is a best practice starting point that should be recrafted to suit your present need.
- setup.sh is a script that sets everything up, installing bundle locally, installing the gems, setting up a 'hello_world' inspec profile for testing, etc.

## Initialize the new ruby environment

cd into the ``stuff4`` directory and allow direnv to configure the environment:

```bash
➜  DUMP cd stuff4
direnv: error /Users/gavindidrichsen/DUMP/stuff4/.envrc is blocked. Run `direnv allow` to approve its content
➜  stuff4 dirennv allow
direnv: loading ~/DUMP/stuff4/.envrc
direnv: export +BUNDLE_BIN +GEM_HOME +GEM_PATH +GEM_ROOT +RUBYOPT +RUBY_ENGINE +RUBY_ROOT +RUBY_VERSION +SSL_CERT_FILE ~PATH
```

Run ``setup.sh`` which installs bundle, inspec, a hello_world inspec profile, and runs the profile test.  The output will look something like:

```bash
➜  stuff4 ./setup.sh
Fetching gem metadata from https://rubygems.org/.........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies....
Fetching rake 13.0.1
...
...
...
 ─────────────────────────── InSpec Code Generator ───────────────────────────

Creating new profile at /Users/gavindidrichsen/DUMP/stuff4/hello_world
 • Creating file README.md
 • Creating directory controls
 • Creating file controls/example.rb
 • Creating file inspec.yml


Profile: InSpec Profile (hello_world)
Version: 0.1.0
Target:  local://

  ✔  tmp-1.0: Create /tmp directory
     ✔  File /tmp is expected to be directory

  File /tmp
     ✔  is expected to be directory

Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 2 successful, 0 failures, 0 skipped
➜  stuff4
```

The ``stuff4`` directory is now a ready-to-use ruby environment.

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
