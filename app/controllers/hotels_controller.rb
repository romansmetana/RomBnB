class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show]
  def index
    @hotels = Hotel.all
    @hotels_count = Hotel.count
  end

  def show
  end
  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
end
