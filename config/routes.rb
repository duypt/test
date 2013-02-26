# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
# get 'polls', :to => 'polls#index'
#get 'polls', :to => 'polls#index'
#post 'post/:id/vote', :to => 'polls#vote'
if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    match 'polls', :to => 'polls#index', :via => [:get, :post]
    match 'post/:id/vote', :to => 'polls#vote', :via => [:get, :post]
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.with_options :controller => 'polls' do |bw_routes|
      bw_routes.with_options :conditions => {:method => :get} do |bw_views|
        bw_views.connect 'polls', :action => 'polls'
      end
      bw_routes.with_options :conditions => {:method => :post} do |bw_views|
        bw_views.connect 'post/:id/vote', :action => 'vote'
      end
    end
  end
end