Rails.application.routes.draw do
  mount_devise_token_auth_for 'Administrator', at: 'auth'

  constraints Subdomain::Api do
    namespace :api, path: Subdomain::Api.path do
      mount_devise_token_auth_for 'Administrator', at: 'auth'
    end
  end
end
