class CreateTerrariumEnviroments < ActiveRecord::Migration[5.2]
  def change
    create_table :terrarium_enviroments do |t|
      t.references :terraria, foreign_key: true

      t.timestamps
    end
    add_index :terrarium_enviroments, [:terraria_id, :created_at]
  end
end
