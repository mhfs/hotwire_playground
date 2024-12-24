class AnimalsController < ApplicationController
  def index
    @animals = Animal.order(:name).all
    @animal = Animal.find(params[:id]) if params[:id]

    if turbo_frame_request?
      render :show, layout: false
    else
      render :index
    end
  end
end
