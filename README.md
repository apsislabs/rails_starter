# README

## Getting Started

1. `docker compose up -d`
2. wait for it...
3. visit `localhost:3000`
4. rejoice!

### Connection to the container

You can either run:

```
$ docker compose exec web sh
```

or

```
$ bin/ssh_to_container
```

### Renaming your app

Renaming your app is super simple, first clone into its own folder. Then update the following:

* `config/application.rb`
  * change `RailsStarter` to `NewName`
* `package.json`
  * change `STARTER_REPLACE_NAME` to `new_name`

### Changing Port

By default we have set this up to use port 3000, but as every rails app uses that port you may conflict with other projects. To update to port 5000 for example, change the following:

* `compose.yml` - change `"3000:3000"` -> `"5000:3000"`
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

### Enabling Assets

By default, this repo comes set up to run [`vite_rails`](https://vite-ruby.netlify.app/), along with React and Stimulus. This is our recommended setup for a monolith, where you plan to build the frontend as part of your Rails app.

To enable assets, you'll need to uncomment the `vite` container in `compose.yml`, along with the `vite` environment variables and volumes. This will start the asset building container along with the rest of the application, will place built assets from the `frontend` directory into `public`.

To actually _see_ these assets, you'll need to uncomment the `vite_*_tag` entries in `app/views/layouts/application.html.erb`. Once that's done, you should have hot reloading of CSS & JS, along with automatic refresh when a Rails view changes.

### Disabling Assets

While the assets build and inclusion is disabled by default, if you plan to use a _different_ mechanism for building your assets (a different builder, an external client, etc.), you may want to remove all the `vite` stuff we've set up for you.

If that's the case, you'll want to delete all of the following:

1. `vite_*_tag` entries from `app/views/layouts/application.html.erb`
2. `config/vite.js`
3. `vite.config.js`
4. `bin/vite`
5. `docker/start_assets.sh`
6. `vite_rails` from `Gemfile`
7. References to `vite` in `config/initializers/content_security_policy.rb`
8. Optionally, `package.json` and `package-lock.json` & `node_modules`
9. Optionally, the entire `frontend/` directory

### Recommended Reading

- http://www.betterspecs.org/
- https://github.com/ankane/production_rails
- https://github.com/ankane/secure_rails
- https://robots.thoughtbot.com/its-about-time-zones

## The Containers

If you look in `compose.yml` you'll notice that we've spun up a number of containers, not all of which may be useful for your project.

1. **web**: Your core container which runs the `rails` server process.
2. **worker**: A duplicate of your core app, but running `solid_queue` instead. [Disabled by Default]
3. **vite**: A duplicate of your core app, but running `vite_rails` instead. [Disabled by Default]
4. **postgres**: Your application's database.
5. **mailhog**: Mailcatcher for preventing outbound emails from escaping.

To cleanup all containers, volumes and networks execute `docker compose down -v`

---

# Built by Apsis

[![apsis](https://s3-us-west-2.amazonaws.com/apsiscdn/apsis.png)](https://www.apsis.io)

`rails_starter` was built by Apsis Labs. We love sharing what we build! Check out our [other libraries on Github](https://github.com/apsislabs), and if you like our work you can [hire us](https://www.apsis.io/work-with-us/) to build your vision.
