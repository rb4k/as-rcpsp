SampleApp::Application.routes.draw do

  resources :projects
  resources :procedure_resources
  resources :procedures
  resources :resources
  resources :procedure_procedures
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/help', to: 'static_pages#help'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/rcpsp', to: 'static_pages#rcpsp'

  match 'procedure_procedure/graph', :to => 'procedure_procedures#graph'

  match 'rcpsp/read_optimization_results', :to => 'rcpsps#read_optimization_results'
  match 'rcpsp/optimize', :to => 'rcpsps#optimize'
  match 'rcpsp/solution', to: 'rcpsps#solution'

  match 'rcpsp/read_optimization_results2', :to => 'rcpsps#read_optimization_results2'
  match 'rcpsp/optimize2', :to => 'rcpsps#optimize2'
  match 'rcpsp/solution2', to: 'rcpsps#solution2'
end
