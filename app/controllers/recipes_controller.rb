class RecipesController < ApplicationController
    include RecipesHelper
    before_action :redirect_if_not_logged_in
    before_action :redirect_if_not_admin, only: [:new, :create, :edit, :update, :destroy]

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

    def recipes_alphabetical_order
        @recipes = Recipe.ordered_alphabetical_order
    end

    def recipes_fastest_cook_time
        @recipes = Recipe.ordered_fastest_cook_time
    end

    def recipes_recently_created
        @recipes = Recipe.ordered_by_recently_created
    end

    def show
        find_recipe
    end

    def edit 
        find_recipe
    end

    def update 
        find_recipe
        find_recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
    end

    def destroy
        find_recipe
        find_recipe.destroy
        redirect_to recipes_path
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
