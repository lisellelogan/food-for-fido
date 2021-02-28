class CommentsController < ApplicationController
    include CommentsHelper
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]

    def new
        if verify_if_recipe_exists
            @comment = @recipe.comments.build 
        else  
            @comment = Comment.new
            @comment.build_recipe
        end
    end

    def create 
        @comment = Comment.new(comment_params)
        @recipe = Recipe.find_by_id(params[:recipe_id])
        @comment.recipe = @recipe
        @comment.user = current_user
        if @comment.save 
            redirect_to recipe_path(@comment.recipe)
        else  
            render :new
        end
    end

    def index
        if verify_if_recipe_exists
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
        @comment.update(comment_params)
        redirect_to recipe_path(comment.recipe)
    end

    def destroy 
        find_comment
        @comment.delete
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
