class SessionsController < ApplicationController
    
    def signup 
      render :signup 
    end 
  
    def login
        @user = User.new
      end
    
      def create
        @user = User.find_by(email: params[:username][:email])
        if @user && @user.authenticate(params[:username][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:message] = "Invalid email or password"
          redirect_to login_path
        end
      end
    
      def logout
        session.clear
        redirect_to login_path
      end

    

end
