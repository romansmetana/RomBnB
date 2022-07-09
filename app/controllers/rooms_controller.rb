class RoomsController < ApplicationController
    before_action :set_hotel, only: %i[ new create edit update ]
    before_action :set_room, only: %i[edit update]
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

    def edit

    end

    def update
        if @room.update(room_params_require)
            flash[:success] = 'Room was successfuly updated'
            redirect_to root_path
        else
            flash[:danger] = 'Something wrong..'
            redirect_to root_path
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
