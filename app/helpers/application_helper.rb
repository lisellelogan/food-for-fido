module ApplicationHelper
    
    def current_user
        current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def verify_user
        redirect_to login_path unless logged_in?
    end

    def authorized_admin
        if !logged_in? && !current_user.admin
            redirect_to login_path
        end
    end
    
end
