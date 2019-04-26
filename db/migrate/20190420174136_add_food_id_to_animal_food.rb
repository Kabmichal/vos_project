class AddFoodIdToAnimalFood < ActiveRecord::Migration[5.2]
  def change
    add_column :animal_foods, :food_id, :int
  end
end
