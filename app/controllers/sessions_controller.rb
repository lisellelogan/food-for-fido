class SessionsController < ApplicationController

    def new
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    def omniauth 
        user = User.create_from_omniauth(auth)

        if user.valid?
            set_session_and_redirect_to_user(user)
        else 
            flash[:message] = user.errors.full_messages.join("")
            redirect_to root_path
        end
    end

    def create 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            set_session_and_redirect_to_user(user)
        else  
            flash[:message] = "Invalid credentials. Please sign up or try again."
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
    private 

    def auth 
        request.env['omniauth.auth']
    end

    def set_session_and_redirect_to_user(user)
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

end
