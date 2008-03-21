ActionController::Routing::Routes.draw do |map|
  map.root :controller => "posts"
  
  map.resources :comments, :users, :categories, :posts, :searches, :links

  map.resource :session
  
  map.with_options :controller => "users" do |page|    
    page.activate '/activate/:activation_code', :action => 'activate'
    page.signup '/signup', :action => 'new'
    page.forgot_password '/forgot_password', :action => 'forgot_password'
    page.reset_password '/reset_password/:id', :action => 'reset_password'
  end
  
  map.with_options :controller => "sessions" do |page|
    page.login "/login",   :action => "new"
    page.logout '/logout',:action => 'destroy'
  end
  
  map.namespace :admin do |admin|
    admin.root :controller => "categories"
    admin.resources :categories, :posts, :links, :users
  end
  
  map.connect 'posts/:permalink', :controller => 'posts', :action => 'show'
  
  map.connect ':controller/:action/:id'
  
  map.connect ':controller/:action/:id.:format'
end
