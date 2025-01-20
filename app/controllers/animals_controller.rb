class AnimalsController < ApplicationController
  include ActionView::RecordIdentifier

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

  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      format.turbo_stream do
        if @animal.save
          render turbo_stream: [
            turbo_stream.close_drawer,
            turbo_stream.prepend("animals-list", partial: "animal_row", locals: { animal: @animal })
          ]
        else
          render(
            AnimalFormDrawerComponent.new(animal: @animal),
            status: :unprocessable_entity,
            content_type: "text/html"
          )
        end
      end
    end
  end

  def edit
    render(AnimalFormDrawerComponent.new(animal: @animal))
  end

  def update
    respond_to do |format|
      format.turbo_stream do
        if @animal.update(animal_params)
          render turbo_stream: [
            turbo_stream.close_drawer,
            turbo_stream.replace(dom_id(@animal), partial: "animal_row", locals: { animal: @animal })
          ]
        else
          render(
            AnimalFormDrawerComponent.new(animal: @animal),
            status: :unprocessable_entity,
            content_type: "text/html"
          )
        end
      end
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
