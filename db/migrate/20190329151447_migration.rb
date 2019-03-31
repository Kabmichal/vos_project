class Migration < ActiveRecord::Migration[5.2]
  def change
    add_reference :animals,:users, {index: true, foreign_key: true}
    add_reference :animals, :animal_types, {index: true, foreign_key: true}
    add_reference :special_situations, :animals, {index: true, foreign_key: true}
    add_reference :animal_foods, :foods, {index: true, foreign_key: true}
    add_reference :animal_foods, :animals,{index: true, foreign_key: true}
    add_reference :terrarium_enviroments, :terraria, {index: true, foreign_key: true}
    add_reference :terrarium_enviroments, :animals, {index: true, foreign_key: true}
  end
end
