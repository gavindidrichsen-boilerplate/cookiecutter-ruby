# Guard and RSpec

## Installation

Install all the required gems:

```bash
./setup.sh
```

Note that a clean hanami application has been created beneath the {{cookiecutter.hanami_application}} directory.  You can manually create the same with the following command

```bash
bundle exec hanami new {{cookiecutter.hanami_application}}
```

To create your first action do something like:

```bash
# NOTE books/index NOT books#index
cd {{cookiecutter.hanami_application}}
bundle exec hanami generate action web books/index
```

Start Guard to continuously monitor the tests:

```bash
bundle exec guard --clear
```

Note that shortcuts are available as aliases and defined in the .env/bin directory:

* beh = bundle exec hanami
* begc = bundle exec guard --clear
* bera = bundle exec rake

Some of the avaliable hanami commands are as follows:

```bash
# start the test server
beh server
# create a new model or 'entity'
beh generate model book
# run a db migration
beh db prepare
# list available routes
beh routes
```

## References:

* [Quick Start (this document)](https://guides.hanamirb.org/introduction/getting-started/)
