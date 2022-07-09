class RoomsController < ApplicationController
    before_action :set_hotel, only: %i[ new create ]
    def new
        @room = Room.new
    end

    def create
        @room = @hotel.rooms.build(room_params)
        if @room.save
            flash[:success] = 'Room was successfuly created'
            redirect_to root_path
        else
            flash[:danger] = 'Something wrong..'
            redirect_to root_path
        end
    end
    private

    def set_hotel
        @hotel = Hotel.find(params[:hotel_id])
    end
    
    def room_params
       params.permit(:name, :price, :square, :capacity, :count, :double_bed, :single_bed, :hotel_id) 
    end
end
