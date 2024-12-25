# frozen_string_literal: true

class DrawerComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
