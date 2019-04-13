class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :animals, [:user_id, :created_at]
  end
end
