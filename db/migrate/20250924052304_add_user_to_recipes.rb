class AddUserToRecipes < ActiveRecord::Migration[8.0]
  def change
    add_reference :recipes, :user, foreign_key: true, null: true
  end
end
