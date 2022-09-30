Rails.application.routes.draw do
  namespace :api, path: SubdomainApi.path do
    mount_devise_token_auth_for 'Administrator',
                                at: 'admin',
                                skip: [
                                  :registrations, :sessions,
                                  :passwords, :confirmations,
                                ]

    devise_scope :api_administrator do
      ## sessions
      post '/admin/login', to: 'admin/sessions#create'
      delete '/admin/logout', to: 'admin/sessions#destroy'
      # post '/admin/refresh', to: 'admin/sessions#update'
    end

    resources :posts, except: %i[create]
  end
end
