class ReviewsController < ApplicationController
    before_action :find_landmark
    def new 
        @landmark = Landmark.new
        @review = @landmark.reviews.new 
    end 

    def create
        @review = current_user.reviews.build(reviews_params)
        if @review.save
            flash[:message] = "Review has been added"
        redirect_to landmark_review_path(@review.landmark)
        else
            render :new 
        end 
    end 

    def index 
        @reviews = @landmark.reviews 
    end 

    def show 
        @review = @landmark.reviews.find_by(id: params[:id])
    end 

    def destroy
        @review.destroy 
        redirect_to landmark_reviews_path
    end 

    private

    def reviews_params 
     params.require(:review).permit(:review, :landmark_id, :user_id)
    end 

    def find_landmark 
     @landmark = Landmark.find_by(id: params[:landmark_id])
    end 
end
