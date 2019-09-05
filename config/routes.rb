Rails.application.routes.draw do
<<<<<<< HEAD
  
 resources :cart_items
 resources :carts
 resources :items
  
 devise_for :users, controllers: {registrations: "registrations"}
=======
 
 resources :items
  resources :carts 
  devise_for :users
>>>>>>> master

 root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
