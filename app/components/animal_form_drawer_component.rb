# frozen_string_literal: true

class AnimalFormDrawerComponent < ViewComponent::Base
  def initialize(animal:)
    @animal = animal
  end
end
