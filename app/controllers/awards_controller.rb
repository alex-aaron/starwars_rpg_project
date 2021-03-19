class AwardsController < ApplicationController

    def index
        @awards = Award.all
        @year_sorted_awards = Award.sort_by_year
    end

    def show
        @award = Award.find_by_id(params[:id])
        @award_creator = User.find_by_id(@award.user_id)
    end

    def new
        if user_signed_in?
            @award = Award.new
            @user = current_user
        else
            redirect_to user_session_path
            flash[:alert] = "You must be logged into to create awards."
        end
    end

    def create
        if params[:award][:year].match(/[a-zA-Z]/)
            redirect_to new_award_path
            flash[:alert] = "Enter year only as a number. Example: 1999"
        else
            @user = current_user
            @award = Award.new(award_params) 
            @award.user_id = @user.id
            if @award.valid?
                @award.save
                redirect_to award_path(@award)
            else
                render :new
            end
        end
    end

    def edit 
        @award = Award.find_by_id(params[:id])
        @award_creator = User.find_by_id(@award.user_id)
        if user_signed_in?
            if current_user.id != @award_creator.id
                redirect_to award_path(@award)
                flash[:alert] = "You can not edit another user's awards."
            end
        else
            redirect_to '/users/sign_in'
            flash[:alert] = "You must be signed in to edit."
        end
    end

    def update
        award = Award.find_by_id(params[:id])
        if award_field_blank?
            redirect_to edit_award_path(award)
            flash[:alert] = "Please make sure every award category is filled in."
        elsif params[:award][:year].match(/[a-zA-Z]/)
            redirect_to edit_award_path(award)
            flash[:alert] = "Make sure year is entered as four digits. Example: 1999"
        else
            award.update(award_params)
            redirect_to award_path(award)
        end
    end

    def destroy
        award = Award.find_by_id(params[:id])
        if user_signed_in?
            if current_user.id == award.user_id
                award.delete
                flash[:alert] = "Item has been deleted."
                redirect_to awards_path
            else
                flash[:alert] = "You can not delete another user's awards."
                redirect_to awards_path
            end
        else
            flash[:alert] = "You must be signed in to edit or delete."
             redirect_to awards_path
        end        
    end

    private

    def award_params 
        params.require(:award).permit(:year, :best_film, :best_director, :best_actor, :best_actress, 
        :best_supporting_actor, :best_supporting_actress, :best_screenplay, :best_cinematography, 
        :best_film_editing, :best_score)
    end

    def award_field_blank?
        count = 0
        award_params.each do |key, value|
            if value == ""
                count += 1
            end
        end
    
        if count > 0
            true
        else
            false
        end
    end
end

