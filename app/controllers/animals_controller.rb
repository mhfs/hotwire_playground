class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[index drawer update]

  def index
    @animals = Animal.order(:name).all

    render :index
  end

  def drawer
    if @animal && turbo_frame_request?
      if @edit
        render(AnimalFormDrawerComponent.new(animal: @animal))
      else
        render(AnimalDrawerComponent.new(animal: @animal))
      end
    end
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
    @edit = params[:option] == "edit"
  end

  def animal_params
    params.require(:animal).permit(:name, :family)
  end
end
