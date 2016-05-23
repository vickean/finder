class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def show
  end

  def index
  end

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end

  def destroy
    Location.find(params[:id]).destroy
    redirect_to locations_path
  end
end
