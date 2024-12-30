# frozen_string_literal: true

class DrawerComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(title:, previous_url:)
    @title = title
    @previous_url = previous_url
  end

  def wrap_in_turbo_frame(&block)
    if helpers.turbo_frame_request?
      turbo_frame_tag "drawer-frame", &block
    else
      render DrawerFrameComponent.new(previous_url: @previous_url) do
        capture(&block)
      end
    end
  end
end
