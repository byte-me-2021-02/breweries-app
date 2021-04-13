class Api::BreweriesController < ApplicationController
  def index
    breweries = Brewery.where.not(lat: nil)
    address = params[:search]
    results = Geocoder.search(address)

    closest_brewery = {distance: 9999999999999999}
    breweries.each do |brewery|
      
      current_brewery = {
        distance: Geocoder::Calculations.distance_between(results.first.coordinates, [brewery.lat,brewery.lng]),
        brewery: brewery.name,
        address: brewery.address,
      }
      if closest_brewery[:distance] > current_brewery[:distance]
        closest_brewery = current_brewery
      end
    end
    render json: closest_brewery
  end
end
