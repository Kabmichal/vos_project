class CreateTerraria < ActiveRecord::Migration[5.2]
  def change
    create_table :terraria do |t|
      t.float :temperature
      t.float :humidity

      t.timestamps
    end
  end
end
