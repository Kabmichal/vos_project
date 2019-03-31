class CreateAnimalFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_foods do |t|
      t.integer :food_id
      t.integer :count

      t.timestamps
    end
  end
end
