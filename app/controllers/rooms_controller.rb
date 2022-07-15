class RoomsController < ApplicationController
  before_action :set_hotel, only: %i[new create edit update destroy]
  before_action :set_room, only: %i[edit update destroy]
  def new
    authorize Room
    @room = Room.new
  end

  def create
    authorize Room
    @room = @hotel.rooms.build(room_params)
    if @room.save
      flash[:success] = 'Room was successfuly created'
      redirect_to root_path
    else
      flash[:danger] = @room.errors.full_messages.join(', ')
      redirect_to new_hotel_room_path
    end
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

  def destroy
    authorize @room
    if @room.destroy
      flash[:success] = 'Room was successfuly destroy'
    else
      flash[:danger] = 'Something wrong..'
    end
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
