class SessionsController < ApplicationController
    
    def new
        if user_signed_in?
            redirect_to awards_path
        end
    end

    def create
        byebug
        if User.find_by(username: params[:username])
            user = User.find_by(username: params[:username])
            session[:user_id] = user.id
            redirect_to awards_path
        else
            redirect_to '/login'
            # add message
        end
    end

    def destroy
        if session[:user_id]
            session.delete :user_id
        end
    end
        
end