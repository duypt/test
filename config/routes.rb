# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
# get 'polls', :to => 'polls#index'
#get 'polls', :to => 'polls#index'
#post 'post/:id/vote', :to => 'polls#vote'
if Rails::VERSION::MAJOR < 3
  ActionController::Routing::Routes.draw do |map|
    #map.connect 'adburndown/:action/:id', :controller => :adburndown
  map.connect 'polls/:action/:id', :controller => :polls
  end
else
  #match 'adburndown/(:action(/:id))', :controller => 'adburndown'
  get 'polls', :to => 'polls#index'
post 'post/:id/vote', :to => 'polls#vote'
end