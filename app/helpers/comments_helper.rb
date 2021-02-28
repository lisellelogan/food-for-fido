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

    def verify_if_recipe_exists
        params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
    end
end
