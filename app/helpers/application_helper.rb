module ApplicationHelper

    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end 
    
    def logged_in
    unless current_user 
        redirect_to login_path
      end 
    end

    
    def authenticate
        if !logged_in?
        redirect_to login_path 
        end 
     end 
end
