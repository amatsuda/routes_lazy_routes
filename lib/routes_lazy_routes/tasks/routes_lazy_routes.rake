# frozen_string_literal: true

if Rake::Task.task_defined?('routes')
  namespace :routes_lazy_routes do
    task :eager_load do
      RoutesLazyRoutes.eager_load!
    end
  end

  Rake::Task['routes'].enhance ['routes_lazy_routes:eager_load']
end
