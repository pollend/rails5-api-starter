require "sidekiq/web"

Rails.application.routes.draw do
  #devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  ## For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :chapter do
        resources :event do
          post 'tag', to: 'events#tags'
        end
      end
      resources :university
    end
  end
  namespace :Auth do
  end



  if Rails.env.development?
    mount Sidekiq::Web => "/sidekiq"
    mount Logster::Web => "/logs"
    #mount Logster::Web => "/logs"
  else
    # only allow sidekiq in master site
   # mount Sidekiq::Web => "/sidekiq", constraints: AdminConstraint.new(require_master: true)
   # mount Logster::Web => "/logs", constraints: AdminConstraint.new
  end
end
