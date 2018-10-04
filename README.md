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

Renaming your app is super simple, first clone into its own folder. Then update the following:

* `config/application.rb`
  * change `RailsStarter` to `NewName`

### Changing Port

By default we have set this up to use port 3000, but as every rails app uses that port you may conflict with other projects. To update to port 5000 for example, change the following:

* `docker-compose.yml` - change `"3000:3000"` -> `"5000:3000"`
* `.env.development` - change `APP_PORT=3000` -> `APP_PORT=5000`

### Upgrading Rails

We try to keep the base repository up to date, but when you pull it's worth looking into whether you need to upgrade rails. A [guide can be found on the rails website](http://guides.rubyonrails.org/upgrading_ruby_on_rails.html).

As of Rails 5.1, the upgrade process should be as simple as:

1. Update the `rails` gem in `Gemfile`
2. Run `bundle install`
3. Run `rails app:update` for an interactive upgrade

### Configuring Gems

There are a number of gems that need configuration to work:

- Configure [`simple_form`](https://github.com/plataformatec/simple_form)
- Ensure columns for [`discard`](https://github.com/jhawthorn/discard)

### Recommended Reading

- http://www.betterspecs.org/
- https://github.com/ankane/production_rails
- https://github.com/ankane/secure_rails
- https://robots.thoughtbot.com/its-about-time-zones

## The Containers

If you look in `docker-compose.yml` you'll notice that we've spun up a number of containers, not all of which may be useful for your project.

1. **web**: Your core container which runs the `rails` server process.
2. **worker**: A duplicate of your core app, but running `sidekiq` instead. [Disabled by Default]
3. **redis**: A `redis` instance for `sidekiq`. [Disabled by Default]
4. **localstack**: [`localstack`](https://github.com/localstack/localstack) is a suite of fake AWS services. [Disabled by Default]
5. **postgres**: Your application's database.
6. **stripe**: An officially supported stripe mock. [Disabled by Default]

To cleanup all containers, volumes and networks execute `docker-compose down -v`

## Default Routes
* `/_dev/letter_opener` - View emails send from the rails application
* `/_dev/sidekiq` - View active jobs and other statistics for Sidekiq
