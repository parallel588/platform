require 'sidekiq/web'

Basekto::Application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index', as: 'home_without_locale'
  
  
  
  scope "(:locale)", :locale => /en|el|de/ do
    root 'home#index', as: 'home'
    
    
    # USER AUTHENTICATION - REGISTRATION
    devise_for :users, 
      path: "/", 
      path_names: { 
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'password', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '/'
      }  
    
    get 'welcome' => "home#welcome", as: "welcome_new_user"
    get 'welcome-back' => "home#index", as: "welcome_back_existing_user"
    # END of USER AUTHENTICATION - REGISTRATION
    
    
    
    get 'preferences' => "users#edit", as: "user_prefernces"
    put 'preferences' => "users#update", as: "update_user_preferences"

    
    resources :products, :except => [:index]
        
    resources :users do
        resources :products, :only => [:index]        
        collection do
          get :all, :controller => "users", :action => "index", :filter => "all"
          get :buyers, :controller => "users", :action => "index", :filter => "buyers"
          get :sellers, :controller => "users", :action => "index", :filter => "sellers"
        end
    end
    
  end # End of :locale scoping
  
 
  
    
  
  mount Sidekiq::Web => '/sidekiq'
 
end
