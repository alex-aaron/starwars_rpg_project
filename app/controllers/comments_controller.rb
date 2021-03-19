class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @award = Award.find_by_id(params[:award_id])
        @award_creator = User.find_by_id(@award.user_id)
    end

    def show
    end

    def new
        if params[:award_id] && !Award.find_by_id(params[:award_id])
            redirect_to awards_path 
            flash[:alert] = "No award exists with that id."
        elsif user_signed_in?
            @comment = Comment.new(award_id: params[:award_id])
            @award = Award.find_by_id(params[:award_id])
            @award_creator = User.find_by_id(@award.user_id)
        else
            redirect_to user_session_path
            flash[:alert] = "You must be signed in to make a comment."
        end
    end

    def create
        award = Award.find_by_id(params[:comment][:award_id])
        if !user_signed_in?
            flash[:message] = "You must be signed in to make a comment."
            redirect_to user_session_path
        else
            user = current_user
            comment = Comment.create(user_id: user.id, award_id: params[:comment][:award_id], content: params[:comment][:content])
            redirect_to award_comments_path(award)
        end
    end

    def edit
        if params[:award_id] && !Award.find_by_id(params[:award_id])
            redirect_to awards_path 
        elsif user_signed_in?
            if current_user.id == Comment.find_by_id(params[:id]).user_id
                @comment = Comment.find_by_id(params[:id])
                @award = Award.find_by_id(params[:award_id])
                @award_creator = User.find_by_id(@award.user_id)
            else
                flash[:alert] = "You can not edit another user's comments."
                redirect_to award_comments_path(@award)
            end
        else
            flash[:alert] = "You must sign in to edit a comment."
            redirect_to user_session_path
        end
    end

    def update
        @comment = Comment.find_by_id(params[:id])
        @comment.update(content: params[:comment][:content])
        @award = Award.find_by_id(@comment.award_id)
        redirect_to award_comments_path(@award)
    end

    def destroy
        comment = Comment.find_by_id(params[:id])
        award = Award.find_by_id(params[:award_id])
        comment_author = User.find_by_id(comment.user_id)
        if user_signed_in?
            if current_user.id == comment_author.id
                comment.delete
                redirect_to award_comments_path(award)
            else
                redirect_to award_comments_path(award)
                flash[:message] = "You can not delete another user's comments."
            end
        else
            flash[:message] = "You must be signed into edit or delete."
            redirect_to user_session_path
        end
    end

end