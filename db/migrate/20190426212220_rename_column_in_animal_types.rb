class RenameColumnInAnimalTypes < ActiveRecord::Migration[5.2]
  def change
    rename_column :animal_types, :type, :animal_type
  end
end
