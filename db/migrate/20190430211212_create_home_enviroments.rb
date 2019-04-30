class CreateHomeEnviroments < ActiveRecord::Migration[5.2]
  def change
    create_table :home_enviroments do |t|
      t.float :temperature
      t.float :humidity
      t.date :date
      t.time :time
      t.references :home, foreign_key: true


      t.timestamps
    end
    add_index :home_enviroments, [:home_id, :created_at]
  end
end
