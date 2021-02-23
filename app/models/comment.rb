class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :recipe

    validates :ratings, :content, presence: true
    validates :rating, numericality: { only_integer: true }
    validates :rating, inclusion: {in: 1..5}
end
