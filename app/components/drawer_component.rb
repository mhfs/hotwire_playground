class DrawerComponent < ViewComponent::Base
  include Turbo::FramesHelper

  renders_one :footer

  def initialize(title: nil, size: :medium, previous_url: nil, confirm: false, confirm_message: nil, animate: false)
    @title = title
    @size = size
    @previous_url = previous_url
    @confirm = confirm
    @confirm_message = confirm_message
    @animate = animate
  end

  private

  def drawer_classes
    class_names "body", @size, animate: @animate
  end
end
