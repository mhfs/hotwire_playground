module DrawerHelper
  def link_to_drawer(*args, &block)
    options = args.extract_options!.dup
    options[:data] ||= {}
    options[:data][:turbo_frame] = "drawer"

    if block_given?
      path = args[0] || "#"
      link_to(path, options, &block)
    else
      label = args[0]
      path = args[1] || "#"
      link_to(label, path, options)
    end
  end

  def content_for_drawer
    content_for(:drawer) do
      yield
    end
  end

  def drawer_frame
    turbo_frame_tag "drawer", data: { turbo_action: "advance" } do
      content_for(:drawer) if content_for?(:drawer)
    end
  end
end
