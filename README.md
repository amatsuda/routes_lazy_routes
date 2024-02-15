# routes_lazy_routes

routes_lazy_routes is an evil Rails plugin that defers loading the whole bloody routes until the server gets the first request, so the app can spin up quickly. 🤘

This voodoo gem is designed especially for you who are maintaining a huge legacy Rails app that contains hundreds of routes that forces you to wait dozens of seconds per every `rails` command invocation.


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

The first visitor of the server should sacrifice their time for the Rails process to load the routes. First strike is deadly.
If you're bundling this in the production server, it'd be a good idea to throw a jab to the server right after the deployment in order to warm up before accepting real client requests.


## Notes

- You can manually eager_load the routes by calling `RoutesLazyRoutes.eager_load!` (the "load runner").

- `Rails.application.eager_load!` automatically invokes `RoutesLazyRoutes.eager_load!` since that should be what we expect for `Rails.application.eager_load!`.

- Loading an integration test or controller test automatically kicks `RoutesLazyRoutes.eager_load!` since they expect the routes to be loaded.

- And, as already explained, sending a request to the Rails server automatically runs `RoutesLazyRoutes.eager_load!` on the server.

- On the other hand, you need manually calling `RoutesLazyRoutes.eager_load!` inside your worker process (e.g. Sidekiq) to resolve named routes like the following:
  ``` ruby
  # config/initializers/sidekiq.rb
  Sidekiq.configure_server do |config|
    if defined?(RoutesLazyRoutes)
      Rails.application.config.after_initialize do
        RoutesLazyRoutes.eager_load!
      end
    end
  end
  ```

## Contributing

Patches are welcome on GitHub at https://github.com/amatsuda/routes_lazy_routes.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
