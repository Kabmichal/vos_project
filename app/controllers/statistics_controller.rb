class StatisticsController < ApplicationController
  before_action :show
  def show
    @days = AnimalFood.where('animal_foods.current_date = ?', Date.today).sum(:count)
    @animal_calories = ActiveRecord::Base.connection.exec_query(
        "SELECT  at.animal_type as type, floor(AVG(f.calories * af.count)) as cround FROM animal_foods af
        JOIN foods f on f.id = af.food_id
        JOIN animals a ON a.id = af.animal_id
        JOIN animal_types at ON at.id = a.animal_type_id
        GROUP BY  at.id
        ORDER BY at.id")
    @try =  ActiveRecord::Base.connection.exec_query(
        "SELECT  af.current_date, floor(AVG(f.calories * af.count)) FROM animal_foods af
        JOIN foods f on f.id = af.food_id
        JOIN animals a ON a.id = af.animal_id
        JOIN animal_types at ON at.id = a.animal_type_id
        GROUP BY  af.current_date, at.id"
    )
  @my_animal_calories = ActiveRecord::Base.connection.exec_query(
      "SELECT coalesce(round(AVG(f.calories * af.count),2),0) as output, at.animal_type as type FROM animal_foods af
        JOIN foods f on f.id = af.food_id
        JOIN animals a ON a.id = af.animal_id
        JOIN animal_types at ON at.id = a.animal_type_id
        JOIN users u ON u.id = a.user_id
        WHERE u.id = #{current_user.id}
        GROUP BY  at.id")
    @my_animal_calories2 = ActiveRecord::Base.connection.exec_query(
        "SELECT coalesce(round(AVG(f.calories * af.count),2),0) as output, at.animal_type as type FROM animal_foods af
        JOIN foods f on f.id = af.food_id
        JOIN animals a ON a.id = af.animal_id
        JOIN animal_types at ON at.id = a.animal_type_id
        JOIN users u ON u.id = a.user_id
        WHERE u.id = #{current_user.id}
        GROUP BY  at.id
        ORDER BY at.id")
    @number_of_foods_day = ActiveRecord::Base.connection.exec_query(
        "SELECT sum(af.count), af.current_date as date FROM animal_foods af
         JOIN animals a ON a.id = af.animal_id
         JOIN  users u ON u.id = a.user_id
         WHERE u.id = #{current_user.id}
         GROUP BY af.current_date")
  end
end
