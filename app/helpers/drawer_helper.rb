module DrawerHelper
  def link_to_drawer(*args, &block)
    options = args.extract_options!.dup
    options[:data] ||= {}
    options[:data][:controller] ||= "drawer-manager"
    options[:data][:action] ||= "click->drawer-manager#open"

    if options[:advance]
      options[:data][:'drawer-manager-advance-value'] = "true"
    end

    if block_given?
      path = args[0] || "#"
      link_to(path, options, &block)
    else
      label = args[0]
      path = args[1] || "#"
      link_to(label, path, options)
    end
  end
end
