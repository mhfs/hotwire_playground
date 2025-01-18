class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[index show edit update]

  def index
    @animals = Animal.order(:name).all
    @edit = params[:option] == "edit"

    render :index
  end

  def show
    render(AnimalDrawerComponent.new(animal: @animal))
  end

  def new
    @animal = Animal.new
    render(AnimalFormDrawerComponent.new(animal: @animal))
  end

  def edit
    render(AnimalFormDrawerComponent.new(animal: @animal))
  end

  def update
    if @animal.update(animal_params)
      redirect_to animals_path, notice: "Animal was successfully updated."
    else
      render(
        AnimalFormDrawerComponent.new(animal: @animal),
        status: :unprocessable_entity,
        content_type: "text/html"
      )
    end
  end

  private

  def set_animal
    @animal = Animal.find(params[:id]) if params[:id]
  end

  def animal_params
    params.require(:animal).permit(:name, :family)
  end
end
