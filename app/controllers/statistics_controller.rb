class StatisticsController < ApplicationController
  before_action :show
  def show
    @days = AnimalFood.where('animal_foods.current_date = ?', Date.today).sum(:count)
    #@averege_for_animals = Food.joins().group(:animal_type_id).average( :count)
    #@averege_for_animals2=Food.joins("LEFT JOIN animal_foods af ON foods.id = af.food_id").
     #   select("SUM(af.count*foods.calories)").
      #  group("af.food_id")
    #@days = ActiveRecord::Base.connection.exec_query("SELECT af.current_date FROM animal_foods af WHERE af.current_date = #{Date.today}")
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
