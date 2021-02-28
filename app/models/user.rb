class User < ApplicationRecord
    has_secure_password

    has_many :comments
    has_many :recipes, through: :comments

    validates :name, :email, presence: true
    validates :email, uniqueness: true

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16) #assigns random generated password to go around password presence validation
        end
    end
    
end
