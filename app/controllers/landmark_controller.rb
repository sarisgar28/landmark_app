class LandmarkController < ApplicationController

    def index 
        @landmarks = Landmark.all
    end 

end
