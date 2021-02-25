class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else  
            render :new
        end
    end

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find_by(id: params[:id])
    end

    def edit 
        @recipe = Recipe.find_by(id: params[:id])
    end

    def update 

    end

    def destroy

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
