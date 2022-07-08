class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show]
  def index
    @hotels = policy_scope(Hotel).all
    @hotels_count = policy_scope(Hotel).count
  end

  def show; end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
end
