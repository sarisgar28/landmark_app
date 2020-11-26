class LandmarkController < ApplicationController
    before_action :find_landmark, only: [:show, :edit, :update, :destroy]

    def index 
        @landmarks = Landmark.all
    end 


    def new 
        @landmark = Landmark.new 
    end 


    def create
        @landmark = Landmark.new(landmark_params)
        if @landmark.save
            redirect_to landmark_path(@landmark)
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
        redirect_to landmark_path
    end 

private

def find_landmark
    @landmark = Landmark.find_by(id: params[:id])
end 

def landmark_params
    params.require(:landmark).permit(:name, :city, :country, :description, :user_id, :review_id)
end 

end
