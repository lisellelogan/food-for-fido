module ApplicationHelper
    
    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_authorized
        if !logged_in?
            #login path
        end
    end
    

end
