class AnimalsController < ApplicationController
  def index
    @animals = Animal.order(:name).all
  end
end
