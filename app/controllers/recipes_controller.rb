class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find_by(id: params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
    end

    private

    def recipe_params
        params.require(:recipe).permit(
            :name,
            :cook_time,
            :servings,
            :ingredients,
            :directions
        )
    end

end
