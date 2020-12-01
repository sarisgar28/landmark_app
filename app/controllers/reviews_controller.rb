class ReviewsController < ApplicationController

    def new 
        @landmark = Landmark.new
        @review = Landmark.reviews.new 
    end 

    def create
        @review = Review.new(review_params)
        if @review.save
            flash[:message] = "Review has been added for #{@review.landmark.name}"
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

end
