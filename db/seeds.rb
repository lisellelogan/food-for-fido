# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Recipe.destroy_all
Comment.destroy_all

beemo = User.create({name: "Beemo", email: "beemo@beemo.com", email_confirmation: "beemo@beemo.com", password: "beemo"})
seymour = User.create({name: "Seymour", email: "seymour@seymour.com", email_confirmation: "seymour@seymour.com", password: "seymour"})
oscar = User.create({name: "Oscar", email: "oscar@oscar.com", email_confirmation: "oscar@oscar.com", password: "oscar"})
charlie = User.create({name: "Charlie", email: "charlie@charlie.com", email_confirmation: "charlie@charlie.com", password: "charlie"})

chimken_rice = Recipe.create({name: "Chimken Rice", cook_time: 40, servings: 4, ingredients: "rice, chicken, water", directions: "Boil chicken until cooked. Make rice in rice cooker and serve!"})
spawghetti = Recipe.create({name: "Spawghetti", cook_time: 60, servings: 6, ingredients: "pasta, tomatoes, chicken, water", directions: "Boil pasta in water until al dente. While pasta is cooking boil chicken until cooked. Then in a pan add pasta and chicken together with tomato sauce. Wait until cool and then serve!"})
boodday_cake = Recipe.create({name: "Boofday Cake", cook_time: 160, servings: 8, ingredients: "flour, baking soda, peanut butter, applesauce, pumkin puree, egg", directions: "Mix dry ingredients (flour, baking soda) in one bowl. Then in a separate bowl, mix wet ingredients. Then combine dry and wet ingredients. Pre-heat oven to 350 degrees F. Bake for 25-30 min. Wait until cool and serve!"})
veggie_pawty_bowl = Recipe.create({name: "Veggie Pawty Bowl", cook_time: 30, servings: 5, ingredients: "carrots, celery, pumkin, broccoli, beef, brown rice", directions: "Steam all veggies until soft. Cook rice in rice cooker while veggies are cooking. Then in a pan, cook beef. Combine all ingredients and mix. Wait until cool and serve!"})

#comment data
beemo.comments.create(rating: 3, content: "Good but kind of bland.", recipe_id: chimken_rice)
seymour.comments.create(rating: 4, content: "I love a pawsta dish!", recipe_id: spawghetti)
oscar.comments.create(rating: 5, content: "So good! I had this for my dog's birthday and he loved it!", recipe_id: boodday_cake)
charlie.comments.create(rating: 1, content: "Veggies were not my dog's thing.", recipe_id: veggie_pawty_bowl)