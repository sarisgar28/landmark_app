class ReviewsController < ApplicationController

    def new 
        @landmark = Landmark.new
        @review = Landmark.reviews.new 
    end 
end
