# frozen_string_literal: true

class DrawerFrameComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(size: :medium, previous_url: nil)
    @previous_url = previous_url
    @size = size
  end
end
