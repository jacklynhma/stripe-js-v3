Rails.application.routes.draw do
  resources :tests do
    # instance, record = member
    collection do
      get :success
    end
  end

  resources :user 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
