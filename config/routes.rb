Admissionsdatabase::Application.routes.draw do

  resources :families do
    resources :students
    resources :point_of_contacts
    resources :referrals
  end
  
  resources :addresses
  resources :enrollments
  
  root 'welcome#index'
end
