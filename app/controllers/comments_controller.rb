class CommentsController < ApplicationController
    
    def new
        #is this a nested route?
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:brand_id])
            @comment = @recipe.comments.build 
        else  
            @comment = Comment.new
            @comment.build_recipe
        end
    end

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save 
            redirect_to comment_path(@comment)
        else  
            render :new #so that we can see our errors
        end
    end

    def show 
        @comment = Comment.find_by(id: params[:id])
    end

    def index
        @comments = Comment.all
    end

    private 

    def comment_params
        params.require(:comment).permit(
            :rating,
            :content
        )
    end

end
