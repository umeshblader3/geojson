class MainsController < ApplicationController
  def welcome
    client = OpenStreetMap::Client.new
    lattitude = params[:lattitude]
    longitude = params[:longitude]
    @res = {}
    if [lattitude, longitude].all?{|e| e.present? }
      @res = client.reverse(format: 'json', lat: lattitude, lon: longitude)
      puts @res
    end
    respond_to do |format|
      format.html { render :welcome }
      format.js { render :welcome1 }
    end
  end

  def geojson
    client = OpenStreetMap::Client.new
    lattitude = params[:lattitude]
    longitude = params[:longitude]
    @geojson = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "properties": {},
          "geometry": {
            "type": "Point",
            "coordinates": []
          }
        }
      ]
    }
    if [lattitude, longitude].all?{|e| e.present? }
      @res = client.reverse(format: 'json', lat: lattitude, lon: longitude)
      @geojson[:features][0][:geometry][:coordinates].push @res["lat"]
      @geojson[:features][0][:geometry][:coordinates].push @res["lon"]
    end
    respond_to do |format|
      format.json { render json: @geojson }
    end
  end
end
