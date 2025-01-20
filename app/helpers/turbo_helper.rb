module TurboHelper
  def close_drawer
    turbo_stream_action_tag :closeDrawer
  end

  def toast(message, duration: 2)
    turbo_stream_action_tag :append,
      target: "toasts",
      template: ApplicationController.render(ToastComponent.new(message: message, duration: duration), layout: false)
  end
end

Turbo::Streams::TagBuilder.prepend(TurboHelper)
