class Recipe < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments

    validates :name, presence: true
    validates :name, uniqueness: true
end
