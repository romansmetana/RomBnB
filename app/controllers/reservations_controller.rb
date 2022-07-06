class ReservationsController < ApplicationController
    before_action :set_reserv, only: %i[ destroy ]
    def index
        @reservations = Resrvation.all
    end
    
    def create
        if session[:reservation_id]
            
            binding.pry
            
            flash[:warning] = "You have already booked"
            redirect_to reservations_path
        else
            @reservation = Resrvation.create(reserv_params)
             if @reservation.save
                session[:reservation_id] = @reservation.id
                redirect_to root_path
                flash[:success] = "Your reservation was created"
            end
        end
    end

    def destroy
        if @reservation.destroy
            session[:reservation_id] = nil
            redirect_to root_path
            flash[:danger] = "You have canceled your reservation"
        end
    end
    

    private
    def set_reserv
        @reservation = Resrvation.find(params[:id])
    end
    

    def reserv_params 
        params.permit(:user_id, :room_id)
    end
end
