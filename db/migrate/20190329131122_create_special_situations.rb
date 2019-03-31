class CreateSpecialSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :special_situations do |t|
      t.string :note

      t.timestamps
    end
  end
end
