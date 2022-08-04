class ReservationsController < ApplicationController
  include ReservationsHelper
  def index
    @reservations = if params[:status] == "active"
                      policy_scope(Resrvation.active)
                    else
                      policy_scope(Resrvation.archived)
                    end
  end

  def create
    if session[:reservation_id]
      flash[:warning] = 'You have already booked'
      redirect_to reservations_path
    else
      authorize Resrvation
      @reservation = Resrvation.create(reserv_params)
      if @reservation.save
        session[:reservation_id] = @reservation.id
        rooms_count(@reservation.room_id)
        redirect_to root_path
        flash[:success] = 'Your reservation was created'
      end
    end
  end

  def destroy
    authorize Resrvation
    @reservation = Resrvation.find(params[:id])
    room_id = @reservation.room_id
    if @reservation.destroy
      session[:reservation_id] = nil
      rooms_count(room_id)
      redirect_to root_path
      flash[:danger] = 'You have canceled your reservation'
    end
  end

  private

  def reserv_params
    params.permit(:user_id, :room_id, :status)
  end
end
