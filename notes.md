Models:
- User
- Recipe
- Comment

Associations:
- User
    has_many :comments
    has_many :recipes, through: :comments
- Recipe
    has_many :comments
    has_many :users, through: :comments
- Comment
    belongs_to :user
    belongs_to :recipe
