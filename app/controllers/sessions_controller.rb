class SessionsController < ApplicationController

    def new
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    def omniauth 
        
    end

    def create 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else  
            flash[:message] = "Invalid credentials. Please sign up or try again."
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

end
