class SessionsController < ApplicationController

    def new
        if logged_in?
            redirect_to user_path(current_user)
        else 
            user = User.new
        end
    end

    def create 
        user = User.find_by(id: session[:user_id])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else  
            flash[:message] = "Invalid credentials. Please sign up or try again."
            redirect_to login_path
        end
    end

end
