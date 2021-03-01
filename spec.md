# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - user has_many :comments
    - recipe has_many :comments
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - comment belongs_to :user
    - comment belongs_to :recipe
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - user has_many :recipes, through: :comments
    - recipe has_many :users, through: :comments
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - user has_many :comments
    - user has_many :recipes, through: :comments
    - recipe has_many :comments
    - recipe has_many :users, through: :comments
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - comments has a rating and content attribute
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    Recipe validates for the following
    - validates :name, :cook_time, :servings, :ingredients, :directions, presence: true
    - validates :name, uniqueness: true
    - validates :cook_time, :servings, numericality: { only_integer: true }
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    Recipe has the following ActiveRecord scope methods to order all recipes:
    - def self.ordered_alphabetical_order
        self.order(:name)
      end

   -  def self.ordered_fastest_cook_time
        self.order(:cook_time)
      end

    - def self.ordered_by_recently_created
        self.order(created_at: :desc)
      end
- [x] Include signup (how e.g. Devise)
    - has attributes such as email and password and must pass validation
    - has '/signup' route 
- [x] Include login (how e.g. Devise)
    - has attributes such as email and password and must pass validation
    - logs in using sessions
    - has '/login' route 
- [x] Include logout (how e.g. Devise)
    - deletes session
    has '/logout' route
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - can login with google via Omniauth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - comments are nested within recipes
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - use errors.full_messages to display errors when validations fail

Confirm:
- [x] The application is pretty DRY
    - use helper methods and partials
- [x] Limited logic in controllers
    - use helper methods and partials
- [x] Views use helper methods if appropriate
    - helper methods used in recipes.all to filter the display of recipes
- [x] Views use partials if appropriate
    - use partials to render forms for new and edit as well as to clean up logic in other views
    - use collections to display index