class AddDateToAnimalFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :animal_foods, :current_date, :date
  end
end
