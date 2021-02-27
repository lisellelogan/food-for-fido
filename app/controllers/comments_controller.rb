class CommentsController < ApplicationController
    
    def new
        @comment = Comment.new
    end

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save 
            redirect_to comment_path(@comment)
        else  
            render :new #so that we can see our errors
        end
    end

    private 

    def comment_params
        params.require(:comment).permit(
            :rating,
            :content
        )
    end

end
