class SessionsController < ApplicationController
    
    def new
    end

    def create
        if !session[:user_id]
            if User.find_by(username: params[:username])
                user = User.find_by(username: params[:username])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                redirect_to '/login'
            end
        else
            redirect_to '/login'
        end
    end

    def destroy
        if session[:user_id]
            session.delete :user_id
        end
    end
        
end