class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :cook_time
      t.integer :servings
      t.text :ingredients
      t.text :directions

      t.timestamps
    end
  end
end
