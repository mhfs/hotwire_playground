class AnimalsController < ApplicationController
  def index
    @animals = Animal.order(:name).all
    @animal = Animal.find(params[:id]) if params[:id]
    @edit = params[:option] == "edit"

    if turbo_frame_request?
      render :drawer
    else
      render :index
    end
  end

  def update
    @animal = Animal.find(params[:id])
    @edit = true

    if @animal.update(animal_params)
      redirect_to animals_path, notice: "Animal was successfully updated."
    else
      render :drawer, status: :unprocessable_entity
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :family)
  end
end
