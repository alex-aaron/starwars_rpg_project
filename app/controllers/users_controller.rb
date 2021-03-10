class UsersController < ApplicationController

    def index
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :awards_name)
    end
end