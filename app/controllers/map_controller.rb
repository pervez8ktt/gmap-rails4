class MapController < ApplicationController
  # @@lat = 75.8300
  # @@lng = 25.1800
  
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  def m
    logger.info("start")
    @my_map="My Maap"
    @uid=params[:uid]  
    @map=Map.where(:uid => @uid)
    
    if !@map.blank?
      @map_i=Map.find(@map[0][:id])
      logger.info("Map: "+@map.to_json)
      @map_i.longtitude=params[:long].to_f
      @map_i.latitude=params[:lag].to_f
      @map_i.updated_at=Time.now
      @map_i.save
      logger.info("update")
    else
      @map=Map.new
      @map.uid=params[:uid]
      @map.longtitude=params[:long].to_f
      @map.latitude=params[:lag].to_f
      @map.save
      logger.info("new")
    end
    logger.info("three")
    render json: {:status => "Received"}
  end
  
  def map
    @uid="1234"
    @map=Map.where(:uid => @uid)
    logger.info("map: "+@map.to_json)
    @lat = @map[0][:latitude]
    @lng = @map[0][:longtitude]
    Pervez.hi
  end
end
