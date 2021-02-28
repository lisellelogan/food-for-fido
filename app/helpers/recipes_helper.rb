module RecipesHelper
    #create recipe helper to convert string of ingredients to list

     #display ingredients in a list
     def list_of_ingredients(recipe)
       ingredient_list = recipe.ingredients.split(",")
    end

    

end
