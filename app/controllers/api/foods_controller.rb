class Api::FoodsController < ApplicationController
  def index
    @foods = HTTP
      .headers("X-Api-Key" => Rails.application.credentials.foods_api[:api_key])
      .get("https://api.nal.usda.gov/fdc/v1/foods/search?query=#{params[:food]}") ###Set with query in insomnia
      .parse
    render json: { showing: @foods }
  end
end

### Hard Set as oopsed to query below:
#  .get("https://api.nal.usda.gov/fdc/v1/foods/search?query=Steak")
