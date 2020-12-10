class LandmarksController < ApplicationController
    before_action :find_landmark, only: [:show, :edit, :update, :destroy]

    def index 
        @landmarks = current_user.landmarks 

    end 


    def new 
        @landmark = Landmark.new
        @review = @landmark.reviews.new 
    end 


    def create
        @landmark = current_user.landmarks.build(landmark_params)
        if @landmark.save 
            @review = @landmark.reviews.build(reviews_params)
           @review.save
        #    flash[:message] = "#{@landmark.name} successfully created"
        redirect_to landmarks_path(@landmark)
       
        else 
            render :new 
        end 
    end 

    def update 
        @landmark.update(landmark_params)
        redirect_to landmark_path(@landmark)
    end 

    def destroy 
        @landmark.destroy
        redirect_to landmarks_path
    end 

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
