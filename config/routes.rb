Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  
  resources :courses do 
    resources :coursetextbooks do
      resources :comments , only: [:create, :destroy]
    end 
  end

  root"courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
