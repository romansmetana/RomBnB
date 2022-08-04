class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        if @review.save
          flash[:success] = "Object successfully created"
          redirect_to @review
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    private

    def review_params
        params.require(:review).permit(:comment, :rating, :user_id, :room_id)
    end
    
end
