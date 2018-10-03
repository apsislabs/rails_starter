# README

## Getting Started

1. `docker-compose up -d`
2. wait for it...
3. visit `localhost:3000`
4. rejoice!

### Connection to the container

You can either run:

```
$ docker-compose exec web sh
```

or

```
$ bin/ssh_to_container
```

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

## The Containers

If you look in `docker-compose.yml` you'll notice that we've spun up a number of containers, not all of which may be useful for your project.

1. **web**: Your core container which runs the `rails` server process.
2. **worker**: A duplicate of your core app, but running `sidekiq` instead.
3. **redis**: A `redis` instance for `sidekiq`.
4. **localstack**: [`localstack`](https://github.com/localstack/localstack) is a suite of fake AWS services.
5. **postgres**: Your application's database.
6. **stripe**: An officially supported stripe mock.

## Default Routes
* `/letter_opener` - View emails send from the rails application
* `/sidekiq` - View active jobs and other statistics for Sidekiq
