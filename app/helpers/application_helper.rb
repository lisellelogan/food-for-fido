module ApplicationHelper
    
    def logged_in?
        !!current_user
    end

    def current_user
        current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def verify_user
        # if !logged_in?
        #     redirect_to login_path
        # end
        redirect_to login_path unless logged_in?
    end
    

end
