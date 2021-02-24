class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :recipes, through: :comments

    validates :name, :email, presence: true
    validates :email, uniqueness: true
    validates :email, confirmation: true 
    validates :email_confirmation, presence: true
end
