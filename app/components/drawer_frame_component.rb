# frozen_string_literal: true

class DrawerFrameComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(animate: false, size: :medium, previous_url: nil, confirm: false, confirm_message: nil)
    @previous_url = previous_url
    @size = size
    @confirm = confirm
    @confirm_message = confirm_message
    @animate = animate
  end
end
