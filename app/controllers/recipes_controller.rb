class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def show

    end

    def new
        @recipe = Recipe.new
    end

    def create
    end
end