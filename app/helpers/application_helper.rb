module ApplicationHelper
    
    def current_user
        current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to login_path unless logged_in?
    end

    def redirect_if_not_admin
        if !logged_in? && !current_user.admin
            redirect_to login_path
        end
    end
    
end
