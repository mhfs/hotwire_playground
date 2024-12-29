# frozen_string_literal: true

class AnimalDrawerComponent < ViewComponent::Base
  def initialize(animal:)
    @animal = animal
  end
end
