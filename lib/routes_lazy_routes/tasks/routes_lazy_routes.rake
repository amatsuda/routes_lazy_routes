# frozen_string_literal: true

namespace :routes_lazy_routes do
  task :eager_load do
    RoutesLazyRoutes.eager_load!
  end
end

Rake::Task['routes'].enhance ['routes_lazy_routes:eager_load']
