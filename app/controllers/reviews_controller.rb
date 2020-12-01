class ReviewsController < ApplicationController
    before_action :find_landmark
    def new 
        @landmark = Landmark.new
        @review = Landmark.reviews.new 
    end 

    def create
        @review = Review.new(review_params)
        if @review.save
            flash[:message] = "Review has been added"
        redirect_to landmark_path(@review.landmark)
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

    def search 
        @reviews = Review.all 
        render :index
    end 

    private

    def reviews_params 
     params.require(:review).permit(:review, :landmark_id)
    end 

    def find_landmark 
     @landmark = Landmark.find_by(id: params[:landmark_id])
    end 
end
