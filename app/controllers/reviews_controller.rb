class ReviewsController < ApplicationController
    before_action :set_room, only: %i[create]
    
    def new
        @review = Review.new
    end
    def create
        @review = current_user.reviews.new(review_params)
        if @review.save
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
    
end
