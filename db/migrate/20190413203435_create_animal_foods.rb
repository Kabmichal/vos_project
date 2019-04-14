class CreateAnimalFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_foods do |t|
      t.integer :count
      t.time :time
      t.references :animal, foreign_key: true

      t.timestamps
    end
    add_index :animal_foods, [:animal_id, :created_at]
  end
end
