Admissionsdatabase::Application.routes.draw do

  resources :families do
    resources :students
    resources :point_of_contacts
    resources :referrals
  end
  
  resources :addresses
  
  root 'welcome#index'
end
