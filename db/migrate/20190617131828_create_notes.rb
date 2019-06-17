class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.date :date
      t.string :note
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
