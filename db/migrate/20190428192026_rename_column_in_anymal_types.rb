class RenameColumnInAnymalTypes < ActiveRecord::Migration[5.2]
  def change
    rename_column :animal_types, :animal_type, :name
  end
end
