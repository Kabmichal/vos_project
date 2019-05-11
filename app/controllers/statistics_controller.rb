class StatisticsController < ApplicationController
  before_action :show
  def show
    @days = AnimalFood.where('animal_foods.current_date = ?', Date.today).sum(:count)
    @animal_calories = ActiveRecord::Base.connection.exec_query(
        "SELECT round(AVG(f.calories * af.count),2), at.animal_type FROM animal_foods af
        JOIN foods f on f.id = af.food_id
        JOIN animals a ON a.id = af.animal_id
        JOIN animal_types at ON at.id = a.animal_type_id
        GROUP BY  at.id")
  @my_animal_calories = ActiveRecord::Base.connection.exec_query(
      "SELECT round(AVG(f.calories * af.count),2), at.animal_type FROM animal_foods af
        JOIN foods f on f.id = af.food_id
        JOIN animals a ON a.id = af.animal_id
        JOIN animal_types at ON at.id = a.animal_type_id
        JOIN users u ON u.id = a.user_id
        WHERE u.id = #{current_user.id}
        GROUP BY  at.id")
  end
end
