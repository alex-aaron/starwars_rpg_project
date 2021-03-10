class AwardsController < ApplicationController

    def index
    end

    def show
        @award = Award.find_by_id(params[:id])
        @user = User.find_by_id(@award.user_id)
    end

    def new
        if session[:user_id]
            @award = Award.new
        else
            redirect_to '/login'
        end
    end

    def create
        user = User.find_by_id(session[:user_id])
        award = Award.create(award_params)
        award.user_id = user.id
        award.save
        redirect_to award_path(award)
    end

    def update
    end

    private

    def award_params 
        params.require(:award).permit(:year, :best_film, :best_director, :best_actor, :best_actress, :best_supporting_actor, :best_supporting_actress, :best_screenplay, :best_cinematography, :best_film_editing, :best_score)
    end


end
