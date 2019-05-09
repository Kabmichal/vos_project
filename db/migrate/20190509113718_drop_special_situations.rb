class DropSpecialSituations < ActiveRecord::Migration[5.2]
  def change
    drop_table :special_situations
  end
end
