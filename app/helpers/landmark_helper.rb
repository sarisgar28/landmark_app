module LandmarkHelper
    def all_landmarks 
        Landmark.all.ordered_by_name
    end 

  
end
