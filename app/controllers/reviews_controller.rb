class ReviewsController < ApplicationController
    include ReservationsHelper
    before_action :set_room, only: %i[create]

    def new
        @review = Review.new
    end
    def create
        @review = current_user.reviews.new(review_params)
        if @review.save
          change_reservation_status
          flash[:success] = "Review successfully created"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    private

    def review_params
        params.require(:review).permit(:comment, :rating, :user_id, :room_id).merge(room_id: @room.id)
    end

    def set_room
        @room = Room.find_by(id: current_user.resrvations.map{|r| r.room.id}.flatten)
    end

    def change_reservation_status
        reservation = Resrvation.active.find_by(id: current_user.resrvations.map {|r|r.id}.flatten)
        reservation.update(status: 1)
        session[:reservation_id] = nil
        rooms_count(reservation.room.id)
    end
end
