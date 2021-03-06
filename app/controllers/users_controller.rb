class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            set_session_and_redirect_to_user(@user)
        else  
            render :new
        end
    end

    def alphabetize
        @users = User.alphabetize
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :email,
            :password
        )
    end
end
