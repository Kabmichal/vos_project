class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :foods, [:user_id, :created_at]
  end
end
