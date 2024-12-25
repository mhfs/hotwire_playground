class AnimalsController < ApplicationController
  def index
    @animals = Animal.order(:name).all
    @animal = Animal.find(params[:id]) if params[:id]
    @edit = params[:option] == "edit"

    if turbo_frame_request?
      render :show
    else
      render :index
    end
  end
end
