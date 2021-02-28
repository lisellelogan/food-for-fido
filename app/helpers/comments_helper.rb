module CommentsHelper
    def display_header(recipe)
        if recipe
            tag.h1("#{recipe.name}'s Comments")
        else
            tag.h1("All Comments")
        end
    end

    def find_comment
        @comment = Comment.find_by(id: params[:id])
    end
end
