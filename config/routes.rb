Rails.application.routes.draw do
   get 'book/list'
   devise_for :users, controllers: { sessions: "session/new" }
   get 'book/new'
   root 'session#new'
   post 'book/create'
   post 'employees/create'
   get 'employees/list'
   get 'employees/show'
   get 'employees/new'
   get 'employees/edit'
   get 'employees/update'
   post 'manager/create'
   get 'manager/list'
   get 'manager/show'
   get 'manager/new'
   patch 'book/update'
   get 'book/list'
   get 'book/show'
   get 'book/edit'
   get 'book/delete'
   get 'book/update'
   get 'book/show_subjects'
   get 'user/list'
   get 'user/new'
   post 'user/create'
   get 'user/show'
   get 'application/session_time'
   match 'active'  => 'session#active',  via: :get
   match 'timeout' => 'session#timeout', via: :get
   get    '/login',   to: 'session#new'
   post   '/login',   to: 'session#create'
	root :to => "welcome#home", :via => [:get, :post]
   get 'welcome/home', to: 'welcome#home_view'
   get 'session/home', to: 'session#home_view_session'
	get 'records/records'
	get 'actions/actions'
	get 'employees/employees'
   get 'news/news'
   get 'reports/reports'
   get 'tasks/tasks'
   get 'hr/list'
   get 'hr/new'
   post 'hr/create'
   get 'hr/show'
   resources :linkedin
  get '/linkedin_profile', to: 'linkedin#linkedin_profile'
  get '/oauth_account', to: 'linkedin#oauth_account'
  get '/linkedin_oauth_url', to: 'linkedin#generate_linkedin_oauth_url'
  get '/index', to: 'linkedin#index'
  resources :employees
  resources :skills
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
