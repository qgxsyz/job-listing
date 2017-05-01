Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
      resources :jobs do
        member do
          post :publish
          post :hide
        end

        resources :users
        resources :resumes
      end
  end

  namespace :seeker do
    resources :mini_resumes do
      resources :users
    end
  end

  resources :jobs do
    member do
      post :collect
      post :discollect
    end
    resources :resumes
  end

  resources :mini_resumes do
    member do
      post :collect
      post :discollect
    end
  end

  namespace :collect do
    resources :jobs
    resources :mini_resumes
  end

  root 'welcome#index'
end
