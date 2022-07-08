class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show ]
  def index
    @hotels = policy_scope(Hotel).all
    @hotels_count = policy_scope(Hotel).count
  end

  def show; end

  def new
    @hotel = Hotel.new
  end

  def create
    
  end
  

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
end
