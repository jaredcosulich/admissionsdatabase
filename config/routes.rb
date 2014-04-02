Admissionsdatabase::Application.routes.draw do

  resources :students
  resources :families
  resources :point_of_contacts

  root 'welcome#index'
end
