# Including dispatcher.rb in case of Rails 2.x
require 'dispatcher' unless Rails::VERSION::MAJOR >= 3

if Rails::VERSION::MAJOR >= 3
  ActionDispatch::Callbacks.to_prepare do
    # use require_dependency if you plan to utilize development mode
    require 'redmine'
  end
else
  Dispatcher.to_prepare BW_AssetHelpers::PLUGIN_NAME do
    # use require_dependency if you plan to utilize development mode
    require 'redmine'
  end
end

Redmine::Plugin.register :polls do
  name 'Polls plugin'
  author 'DuyPT'
  description 'This is a sample Plugin'
  version '0.0.3'
  project_module :polls do
   	permission :view_polls, :polls => :index
   	permission :vote_polls, :polls => :vote
  end
  menu :project_menu, :polls, { :controller => 'polls', :action => 'index' }, :caption => 'Polls', :after => :activity, :param => :project_id
  settings :default => {'empty' => true}, :partial => 'settings/poll_settings'
end

class PollsHookListener < Redmine::Hook::ViewListener
  def view_projects_show_left(context={} )
    return content_tag("p", "Custom content added to the left")
  end

  def view_projects_show_right(context={} )
    return content_tag("p", "Custom content added to the right")
  end
end
