Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  resources :users, only: [:show, :edit, :update]  
  resources :selflearns
  
  resources :courses do
    
    resources :homeworks do
      resources :studenthomeworks , only: [:index ,:create, :destroy]
    end
    member do
      post :courseregistion
      post :uncourseregistion
    end
    resources :coursetextbooks do
      resources :comments , only: [:create, :destroy]
      member do
        post :finish
        post :notfinish
      end
    end
  end

  root"courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
