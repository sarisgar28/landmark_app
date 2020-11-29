class SessionsController < ApplicationController
    
    def sign_up 
      @user = User.new(username: params[:username], password: params[:password])
      if @user.save 
          session[:user_id] = @user.id 
        redirect_to user_path(@user)
      else 
        flash[:message] = "The username is taken, please try again"
        redirect_to sign_up_path(@user)
      end
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
    
      def google_login
        user_email = request.env['omniauth.auth']['info']['email']
        user_name = request.env['omniauth.auth']['info']['name']
        @user = User.find_or_create_by(email: user_email) do |user|
          user.username = user_name
          user.password = SecureRandom.hex
        end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    

end
