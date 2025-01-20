module TurboHelper
  def close_drawer
    turbo_stream_action_tag :closeDrawer
  end
end

Turbo::Streams::TagBuilder.prepend(TurboHelper)
