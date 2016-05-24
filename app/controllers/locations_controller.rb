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

  def destroy
    Location.find(params[:id]).destroy
    redirect_to locations_path
  end

  def search
    @search_location = Location.new
    @query
    render :search
  end

  def find
    @search_location = Location.new
    @query = Geocoder.search(params[:location][:address])
  end

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end

  def geocoding
    respond_to do |format|
      format.js
    end
  end

  def reverse_geocoding
    respond_to do |format|
      format.js
    end
  end

end
