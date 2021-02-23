Models:
- User
    name:string
    email:string
    password_digest:string
- Recipe
    name:string
    cook_time:integer
    servings:integer
    ingredients:text
    direction:text
- Comment
    rating:integer
    content:text
    user_id:integer
    recipe_id:integer

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
