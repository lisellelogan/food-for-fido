class CommentsController < ApplicationController
    
    def new
        #is this a nested route?
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
            @comment = @recipe.comments.build 
        else  
            @comment = Comment.new
            @comment.build_recipe
        end
    end

    def create 
        if logged_in?
            # @recipe = Recipe.find_by_id(params[:recipe_id])
            # @comment = Comment.new(comment_params)
            # @comment.recipe = @recipe
            # @comment.user = current_user
            @comment = current_user.comments.build(comment_params)
            @comment.recipe = params[:recipe_id]
            if @comment.save 
                redirect_to comment_path(@comment)
            else  
                render :new #so that we can see our errors
            end
        else  
            redirect_to login_path
        end
    end

    def show 
        @comment = Comment.find_by(id: params[:id])
    end

    def index
        #is this a nested route?
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
            #if it is nested, we only want comments of that recipe
            @comments = @recipe.comments
        else  
            #show all the comments
            @comments = Comment.all
        end
    end

    private 

    def comment_params
        params.require(:comment).permit(
            :rating,
            :content,
            :user_id,
            :recipe_id,
            recipe_attributes: [:name, :cook_time, :servings, :ingredients, :directions]
        )
    end

end
