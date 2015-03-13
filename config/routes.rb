Dummy::Application.routes.draw do

  root :to => 'leads#daily_new'

  resources :business_entities

  resources :leads do
    collection do
      get 'daily', :to => 'leads#daily_new'
      post 'daily', :to => 'leads#daily_create'
    end
  end

end
