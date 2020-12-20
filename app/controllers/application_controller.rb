class ApplicationController < ActionController::Base
    # so methodes used in Application Controller can be used in any of the controller but not in views
    # to make this avalible to views we can add this method to helper_method
    helper_method :current_user, :logged_in?

    def current_user
        # memoization will help to hit/check the database once
        # if we have check the db once it will return back if not then it check the db
        # ||= if not then do this
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # !! bang bang will convert anything to boolean so it will return ture or false
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:danger] = "You are not Logged In"
            redirect_to root_path
        end
    end
end
