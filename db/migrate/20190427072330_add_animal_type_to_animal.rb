class AddAnimalTypeToAnimal < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :animal_type_id, :int
  end
end
