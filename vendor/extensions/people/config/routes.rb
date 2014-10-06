Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :people do
    resources :people, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :people, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :people, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
