Rails.application.routes.draw do
  namespace :api, path: SubdomainApi.path do
    mount_devise_token_auth_for 'Administrator',
                                at: 'auth'
  end
end
