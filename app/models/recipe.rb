class Recipe < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments

    validates :name, :cook_time, :servings, :ingredients, :directions, presence: true
    validates :name, uniqueness: true
    validates :cook_time, :servings, numericality: { only_integer: true }

    def self.ordered_alphabetical_order
        self.order(:name)
    end

    def self.ordered_fastest_cook_time
        self.order(:cook_time)
    end

    def self.ordered_by_recently_created
        self.order(created_at: :desc)
    end
    

end
