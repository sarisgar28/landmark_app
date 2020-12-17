class ReviewsController < ApplicationController
    before_action :find_landmark
    before_action :logged_in
    
    def new 
        @review = @landmark.reviews.new 
    end 

    def create
        @review = Review.create(reviews_params)
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

    def edit 
        @review = Review.find(params[:id])
        if @review.user != current_user
            redirect_to landmark_review_path(@review.landmark,@review)
        end
    end 

    def update
        @review = Review.find_by(id: params[:id])
        if @review.user == current_user
            @review.update(reviews_params)
            flash[:messages] = ["Review has been updated!"]
         redirect_to landmark_review_path
        else
            flash[:messages] = ["Oops something went wrong!"]
         redirect_to landmark_review_path(@review.landmark,@review)
        end
    end 

    def show 
        @review = @landmark.reviews.find_by(id: params[:id])
    end 


    def destroy
        @review = Review.find_by(id: params[:id])
        if @review.user == current_user
           @review.destroy 
           redirect_to landmark_reviews_path
        else 
            flash[:messages] = @review.errors.full_messages
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
