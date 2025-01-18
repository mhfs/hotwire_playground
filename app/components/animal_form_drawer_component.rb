# frozen_string_literal: true

class AnimalFormDrawerComponent < ViewComponent::Base
  def initialize(animal:, size: :medium)
    @animal = animal
    @size = size
  end

  def title
    @animal.new_record? ? "New Animal" : "Edit Animal"
  end
end
