class CreateTerraria < ActiveRecord::Migration[5.2]
  def change
    create_table :terraria do |t|
      t.float :temperature
      t.float :humidity
      t.references :user, foreign_key: true


      t.timestamps
    end
    add_index :terraria, [:user_id, :created_at]

  end
end
