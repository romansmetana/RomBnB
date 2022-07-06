class ReservationsController < ApplicationController
  include ReservationsHelper
   def index
    @reservations = Resrvation.all
  end

  def create
    if session[:reservation_id]
      flash[:warning] = 'You have already booked'
      redirect_to reservations_path
    else
      @reservation = Resrvation.create(reserv_params)
      if @reservation.save
        session[:reservation_id] = @reservation.id
        room_count(@reservation.room_id)
        redirect_to root_path
        flash[:success] = 'Your reservation was created'
      end
    end
  end

  def destroy
    @reservation = Resrvation.find(params[:id])
    room_id = @reservation.room_id
    if @reservation.destroy
      session[:reservation_id] = nil
      room_count(room_id)
      redirect_to root_path
      flash[:danger] = 'You have canceled your reservation'
    end
  end

  private

  def reserv_params
    params.permit(:user_id, :room_id)
  end
end
