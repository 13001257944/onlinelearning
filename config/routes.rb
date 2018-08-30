Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  
  resources :courses do
    
    resources :homeworks do
      resources :studenthomeworks , only: [:create, :destroy]
    end
    member do
      post :courseregistion
      post :uncourseregistion
    end
    resources :coursetextbooks do
      resources :comments , only: [:create, :destroy]
    end
  end

  root"courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
