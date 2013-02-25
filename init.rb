Redmine::Plugin.register :polls do
  name 'Polls plugin'
  author 'DuyPT'
  description 'This is a sample Plugin'
  version '0.0.2'
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
