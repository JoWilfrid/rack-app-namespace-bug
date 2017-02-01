# Rack::App namespace bug

Sample app as proof of bug.

The bug concerns namespaces in the rooting process:

You can actually define this kind of URLs: `/api/v1/anything` but not this kind anymore: `/api/v1.0.0/anything` which doesn't work since `rack-app` `v5.11.0` but worked before that.

The "magical" thing is that even if `/api/v1.0.0/anything` doesn't work, `/api/v1.0/anything` works for a reason I don't know.

As said earlier, this project is a sample app. The code is in `config.ru` and the installation process is described below.

PS: If you put `gem 'rack-app', '= 5.10.2'` in the `Gemfile` instead of `gem 'rack-app', '= 5.11.0'`, everything works fine.

## Technical environment

This has been tested with:

* Ubuntu 16.04 LTS
* RVM
* Ruby 2.3.3
* rack-app 5.11.0


## Installation

Clone the repo:

```
git clone git@github.com:JoWilfrid/rack-app-namespace-bug.git rack-app-namespace-bug && cd $_
```

Install bundler & required gems

```
gem install bundler --no-ri --no-rdoc
bundle install
```

## Usage

```
bundle exec rackup
```
