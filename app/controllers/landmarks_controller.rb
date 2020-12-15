class LandmarksController < ApplicationController
    before_action :find_landmark, only: [:show, :edit, :update, :search,:destroy]
    before_action :logged_in

    def index 
        @landmarks = current_user.landmarks.ordered_by_name 

    end 


    def new 
        @landmark = Landmark.new
        @review = @landmark.reviews.new 
    end 


    def create
        @landmark = current_user.landmarks.build(landmark_params)
        if @landmark.save 
            @review = @landmark.reviews.build(reviews_params)
            @review.user = current_user
           @review.save
           flash[:messages] = ["#{@landmark.name} was successfully created"]
        redirect_to landmark_path(@landmark)
       
        else 
            flash[:messages] = @landmark.errors.full_messages
            render :new 
        end 
    end 

    def search 
       all_landmarks.find_by_name
      redirect_to landmark_path(@landmark)
    end 
    # def update 
    #     @landmark.update(landmark_params)
    #     redirect_to landmark_path(@landmark)
    # end 

    # def destroy 
    #     @landmark.destroy
    #     redirect_to landmarks_path
    # end 

private

def find_landmark
    @landmark = Landmark.find_by(id: params[:id])
end 

def landmark_params
    params.require(:landmark).permit(:name, :city, :country, :description)
end 

def reviews_params 
    params.require(:review).permit(:review, :landmark_id, :user_id)
   end 

end
