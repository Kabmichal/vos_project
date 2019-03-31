class CreateTerrariumEnviroments < ActiveRecord::Migration[5.2]
  def change
    create_table :terrarium_enviroments do |t|
      t.integer :terrarium_id

      t.timestamps
    end
  end
end
