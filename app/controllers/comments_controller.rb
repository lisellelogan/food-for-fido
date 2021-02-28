class CommentsController < ApplicationController
    include CommentsHelper

    def new
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
            @comment = @recipe.comments.build 
        else  
            @comment = Comment.new
            @comment.build_recipe
        end
    end

    def create 
        if logged_in?
            @comment = Comment.new(comment_params)
            @recipe = Recipe.find_by_id(params[:recipe_id])
            @comment.recipe = @recipe
            @comment.user = current_user
            if @comment.save 
                redirect_to recipe_path(@comment.recipe)
            else  
                render :new
            end
        else  
            redirect_to login_path
        end
    end

    def index
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
            @comments = @recipe.comments
        else  
            @comments = Comment.all
        end
    end

    def edit 
        find_comment
    end

    def update 
        find_comment
        comment.update(comment_params)
        redirect_to recipe_path(comment.recipe)
    end

    private 

    def comment_params
        params.require(:comment).permit(
            :rating,
            :content,
            :user_id,
            :recipe_id
        )
    end

end
