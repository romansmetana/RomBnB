class RoomsController < ApplicationController
  before_action :set_hotel, only: %i[new create edit update]
  before_action :set_room, only: %i[edit update]
  def new
    @room = Room.new
    authorize @room
  end

  def create
    @room = @hotel.rooms.build(room_params)
    authorize @room
    if @room.save
      flash[:success] = 'Room was successfuly created'
    else
      flash[:danger] = 'Something wrong..'
    end
    redirect_to root_path
  end

  def edit
    authorize @room
  end

  def update
    authorize @room
    if @room.update(room_params_require)
      flash[:success] = 'Room was successfuly updated'
    else
      flash[:danger] = 'Something wrong..'
    end
    redirect_to root_path
  end

  private

  def set_room
    @room = @hotel.rooms.find(params[:id])
  end

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def room_params
    params.permit(:name, :price, :square, :capacity, :count, :double_bed, :single_bed, :hotel_id)
  end

  def room_params_require
    params.require(:room).permit(:name, :price, :square, :capacity, :count, :double_bed, :single_bed, :hotel_id)
  end
end
