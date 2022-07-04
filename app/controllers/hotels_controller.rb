class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
    @hotels_count = Hotel.count
  end

  def show
  end
end
