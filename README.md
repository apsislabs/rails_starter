# README

## Getting Started

### Renaming your app

We install the [`rename`](https://github.com/morshedalam/rename) gem in the dev environment by default. To rename your rails application, run:

```sh
$ rails g rename:into {new name}
```

### Upgrading Rails

We try to keep the base repository up to date, but when you pull it's worth looking into whether you need to upgrade rails. A [guide can be found on the rails website](http://guides.rubyonrails.org/upgrading_ruby_on_rails.html).

As of Rails 5.1, the upgrade process should be as simple as:

1. Update the `rails` gem in `Gemfile`
2. Run `bundle install`
3. Run `rails app:update` for an interactive upgrade

### Configuring Gems

There are a number of gems that need configuration to work:

- Configure [`simple_form`](https://github.com/plataformatec/simple_form)
- Ensure columns for [`paranoia`](https://github.com/rubysherpas/paranoia)

### Recommended Reading

- http://www.betterspecs.org/
- https://github.com/ankane/production_rails
- https://github.com/ankane/secure_rails
- https://robots.thoughtbot.com/its-about-time-zones
