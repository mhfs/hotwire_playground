# frozen_string_literal: true

class ToastComponent < ViewComponent::Base
  def initialize(message:, duration:)
    @message = message
    @duration = duration
  end
end
