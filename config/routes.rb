Dummy::Application.routes.draw do

  root to: 'reports/leads_daily#index'

  resources :business_entities

  resources :leads


  namespace 'reports' do
    resources :leads_daily, only: [:index, :create]
  end

end
