class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            # this will store data in cookies and send the data when we make another request
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "There was something wrong with your login information"
            render 'new'
        end
    end

    def distory
        session[:user_id] = nil
        flash[:success] = "You are logged Out"
        redirect_to root_path
    end
end
