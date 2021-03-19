class UsersController < ApplicationController

    def index
    end

    def show
        @user = User.find_by_id(params[:id])
        @user_awards = @user.awards.sort_by {|award| award.year}
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to user_path(@user)
    end

    def edit
        @user = User.find_by_id(params[:id])
    end

    def update
        @user = User.find_by_id(params[:id])
        @user.awards_name = params[:user][:awards_name]
        @user.save
        redirect_to user_path(@user)
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :awards_name)
    end
end