class SessionsController < ApplicationController

    def new
        if logged_in?
            redirect_to user_path(current_user)
        else 
            @user = User.new
        end
    end

    def create 
        
    end

end
