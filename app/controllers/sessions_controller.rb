class SessionsController < ApplicationController

    def new
        # if logged_in?
        #     redirect_to user_path(current_user)
        # end
    end

    def create 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else  
            flash[:message] = "Invalid credentials. Please sign up or try again."
            render :new
        end
    end

end
