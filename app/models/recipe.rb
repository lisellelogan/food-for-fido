class Recipe < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments

    validates :name, presence: true
    validates :name, uniqueness: true

    #display ingredients in a list
    def list_of_ingredients
        self.ingredients.split(",")
    end

    #display recently created recipes

    #display highly rated recipes

    #display recipes in alphabetical order?

    #display recipes by cook_time (least to greatest)
end
