# Guard and RSpec

## Installation

- `gem install bundler`
- `bundle install`

## Running

Open 2 teminals.  In one startup guard:

```bash
bundle exec guard
# or 'beg' alias
```

## Structure

The set-up of the `Guardfile` is very specific to the directory structure you
have.

Add any alias commands as a shell script to the .env/bin directory.  For example ``beie`` equals:

```bash
#!/usr/bin/env bash

bundle exec inspec exec "${@}"
```

A typical structure is to have `lib` and `spec` folders. That's what our
`Guardfile` is based on.
