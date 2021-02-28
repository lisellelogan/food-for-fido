class Recipe < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments

    validates :name, :cook_time, :servings, :ingredients, :directions, presence: true
    validates :name, uniqueness: true
    validates :cook_time, :servings, numericality: { only_integer: true }

    #display recently created recipes

    #display highly rated recipes
        #self.comments.order(:rating)

    #display recipes in alphabetical order?
        #self.order

    #display recipes by cook_time (least to greatest)
end
