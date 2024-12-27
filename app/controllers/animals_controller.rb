class AnimalsController < ApplicationController
  def index
    @animals = Animal.order(:name).all
    @animal = Animal.find(params[:id]) if params[:id]
    @edit = params[:option] == "edit"

    if @animal && turbo_frame_request?
      if @edit
        render(
          DrawerComponent.new(title: "Edit Animal")
                         .with_content(render_to_string(partial: "form"))
        )
      else
        render(
          DrawerComponent.new(title: "Animal Details")
                         .with_content(render_to_string(partial: "animal"))
        )
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
        DrawerComponent.new(title: "Edit Animal")
                       .with_content(render_to_string(partial: "form")),
        status: :unprocessable_entity
      )
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :family)
  end
end
