# routes_lazy_routes

routes_lazy_routes is an evil Rails plugin that defers loading the whole bloody routes until the server gets the first request, so the app can spin up quickly. 🤘

This voodoo gem is designed especially for you who are maintaining a Rails app that contains hundreds of routes that forces to wait dozens of seconds per every `rails` command invocation.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'routes_lazy_routes'
```

If you're not brave enough, you can limit the group not to include `production` environment.
Indeed, enabling this gem for the processes like batch or job may improve their runtime performance, but so far as that's not a critical problem for your production system, the following setup might be safer.

```ruby
group :development, :test do
  gem 'routes_lazy_routes'
end
```


## Usage

You have nothing to do with it. It should just work beneath the skin.


## Trade-off

The first visitor of the server should sacrifice their time for the Rails process to load the routes.
If you're bundling this in the production server, it'd be a good idea to throw a jab to the server right after the deployment in order to warm up before accepting real client requests.


## Contributing

Patches are welcome on GitHub at https://github.com/amatsuda/routes_lazy_routes.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
