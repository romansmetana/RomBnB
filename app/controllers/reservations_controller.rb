class ReservationsController < ApplicationController
  def index
    @reservations = if params[:status] == 'active'
                      policy_scope(Resrvation.active)
                    else
                      policy_scope(Resrvation.archived)
                    end
  end

  def create
    if current_user.resrvations.active.any?
      flash[:warning] = 'You have already booked'
      redirect_to root_path
    else
      authorize Resrvation
      @reservation = Resrvation.create(reserv_params)
      if @reservation.save
        redirect_to root_path
        flash[:success] = 'Your reservation was created'
      end
    end
  end

  def destroy
    authorize Resrvation
    @reservation = Resrvation.find(params[:id])
    if @reservation.status == 'active'
      if @reservation.destroy
        redirect_to root_path
        flash[:danger] = 'You have deleted your reservation'
      end
    else
      flash[:warning] = "You can't to delete this reservation"
      redirect_to root_path
    end
  end

  private

  def reserv_params
    params.permit(:user_id, :room_id, :status)
  end
end
