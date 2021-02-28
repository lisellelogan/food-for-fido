module ApplicationHelper
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def admin?
        !!current_user.admin
    end

    def redirect_if_not_logged_in
        redirect_to login_path unless logged_in?
    end

    def set_session_and_redirect_to_user(user)
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

    def redirect_if_not_admin
        if admin? == false
            flash[:message] = "User restriction. If you are an admin, please log in."
            redirect_to login_path
        end
    end

    def display_time(date) 
        date.strftime('%m/%d/%y at %H:%M%P')
    end
    
end
