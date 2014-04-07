Admissionsdatabase::Application.routes.draw do

  resources :families do
    resources :students
    resources :point_of_contacts
    resources :referrals
  end
  
  root 'welcome#index'
end
