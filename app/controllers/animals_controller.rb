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
end
