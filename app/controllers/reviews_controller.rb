class ReviewsController < ApplicationController
    before_action :find_landmark
    
    
    def new 
        @review = @landmark.reviews.new 
    end 

    def create
        @review = current_user.reviews.build(reviews_params)
        @review.landmark = @landmark
        if @review.save
            flash[:messages] = ["Review has been added"]
        redirect_to landmark_reviews_path(@review.landmark)
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
        @review = Review.find_by(id: params[:review_id])
        if @review.user == current_user
           @review.destroy 
           redirect_to landmark_reviews_path
        else 
            flash[:messages] =[@review.error.full_messages] 
            redirect_to landmark_review_path(@review.landmark,@review)
        end 
    end 

    private

    def reviews_params 
     params.require(:review).permit(:review, :landmark_id, :user_id)
    end 

    def find_landmark 
     @landmark = Landmark.find_by(id: params[:landmark_id])
    end 
end
