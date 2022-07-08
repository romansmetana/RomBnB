class RoomsController < ApplicationController
    def new
        @hotel = Hotel.find(params[:hotel_id])
        @room = Room.new
    end

    def create
        @room = Room.create(room_params)
        if @room.save
            flash[:success] = 'Room was successfuly created'
            redirect_to root_path
        else
            flash[:danger] = 'Something wrong..'
            redirect_to root_path
        end
    end
    private

    def room_params
       params.permit(:name, :price, :square, :capacity, :count, :double_bed, :single_bed, :hotel_id) 
    end
end
