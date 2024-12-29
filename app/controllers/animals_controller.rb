class AnimalsController < ApplicationController
  def index
    @animals = Animal.order(:name).all
    @animal = Animal.find(params[:id]) if params[:id]
    @edit = params[:option] == "edit"

    if @animal && turbo_frame_request?
      if @edit
        render(AnimalFormDrawerComponent.new(animal: @animal))
      else
        render(AnimalDrawerComponent.new(animal: @animal))
      end

      return
    end

    render :index
  end

  def update
    @animal = Animal.find(params[:id])

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

  def animal_params
    params.require(:animal).permit(:name, :family)
  end
end
