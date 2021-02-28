module RecipesHelper
    #create recipe helper to convert string of ingredients to list

     def list_of_ingredients(recipe)
       ingredient_list = recipe.ingredients.split(",")
    end

    def display_delete_link_if_authorized_admin(recipe)
        if admin? == true
            link_to("Delete Recipe", recipe_path(recipe), method: 'delete')
        else
            link_to("Comment on this Recipe", new_recipe_comment_path(recipe))
        end
    end

    def display_edit_link_if_authorized_admin(recipe)
        if admin? == true
            link_to("Edit Recipe", edit_recipe_path(recipe))
        else  
            link_to("All Comments", recipe_comments_path(recipe))
        end
    end

    def find_recipe
        @recipe = Recipe.find_by(id: params[:id])
    end

end
