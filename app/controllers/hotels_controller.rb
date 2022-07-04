class HotelsController < ApplicationController
  def index
    @hotels_count = Hotel.count
  end

  def show
  end
end
