# frozen_string_literal: true

class AnimalDrawerComponent < ViewComponent::Base
  def initialize(animal:, size: :medium)
    @animal = animal
    @size = size
  end
end
