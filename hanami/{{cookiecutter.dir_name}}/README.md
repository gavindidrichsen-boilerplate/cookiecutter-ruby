# Guard and RSpec

## Installation

Install all the required gems:

```bash
./setup.sh
```

Note that shortcuts are available as aliases and defined in the .env/bin directory:

* beh = bundle exec hanami
* begc = bundle exec guard --clear
* bera = bundle exec rake

Also a clean hanami application has been created beneath the {{cookiecutter.hanami_application}} directory.  You can manually create the same with the following command

```bash
# bundle exec hanamai new {{cookiecutter.hanami_application}}
beh new {{cookiecutter.hanami_application}}
```

To create your first action do something like:

```bash
# NOTE books/index NOT books#index
cd {{cookiecutter.hanami_application}}
# bundle exec hanamai generate action web books/index
beh generate action web books/index
```

Start Guard to continuously monitor the tests:

```bash
# bundle exec guard --clear
begc
```

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
