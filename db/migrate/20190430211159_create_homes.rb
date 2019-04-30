class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :name
      t.integer :size
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :homes, [:user_id, :created_at]
  end
end
