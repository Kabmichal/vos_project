class AnimalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show]
  before_action :correct_user, only: [:destroy]


  def index
    if params[:search]
      @animals= Animal.joins(:animal_type).where("animals.name like ? or animal_types.animal_type like ?", "%#{params[:search]}%","%#{params[:search]}%").paginate(page: params[:page])

    else
      @animals= Animal.all.order('created_at DESC').paginate(page: params[:page])
    end
  end
  def show
    @users = User.all
    @current_user = current_user
    @animal = Animal.find(params[:id])
    session[:animal_id]= @animal.id
    @animal_foods = @animal.animal_foods.paginate(page: params[:page]).order('animal_foods.current_date DESC')
    @food_count = Food.count_by_sql("SELECT COUNT(*) FROM foods f WHERE f.user_id = #{@current_user.id}")
    if @food_count == 0
      @food_count = nil
    end
    if @food_count.nil?
    else
      @animal_food = current_animal.animal_foods.build
      #redirect_to :controller => "animal_foods", action: "create"
    end

    @current_animal_food = current_animal.animal_foods
    @caloriesSql = ActiveRecord::Base.connection.exec_query("SELECT SUM(f.calories) * COUNT(f.id) as amount_of_calories FROM animal_foods af
      JOIN foods f on f.id = af.food_id WHERE af.animal_id = #{current_animal.id}
      GROUP BY f.id")
    @caloriesSql4 = ActiveRecord::Base.connection.exec_query("SELECT SUM(f.calories * af.count) FROM animal_foods af
      JOIN foods f on f.id = af.food_id WHERE af.animal_id = #{current_animal.id} GROUP BY  af.current_date ORDER BY af.current_date")
    @caloriesSql=@caloriesSql.rows
    @caloriesSql3 = ActiveRecord::Base.connection.exec_query("SELECT SUM(f.calories * af.count) FROM animal_foods af
      JOIN foods f on f.id = af.food_id WHERE af.animal_id = #{current_animal.id} AND af.current_date = current_date GROUP BY  af.current_date")

    @caloriesSql2 = "SELECT SUM(f.calories * COUNT(f.id)) as amount_of_calories FROM animal_foods af
      JOIN foods f on f.id = af.food_id WHERE af.animal_id = #{current_animal.id}
      GROUP BY af.current_date"
    @count = @current_animal_food.where('animal_foods.current_date = ?', Date.today).count
    #@count = @current_animal_food.where('current_date BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).count
  end
  def create
    @animal = current_user.animals.build(animal_params)
    if @animal.save
      flash[:success] = 'Animal created'
      redirect_to root_url
    else
      flash.now[:error] = "Could not create animal"
      render 'animals/animal_form'
    end
  end
  def destroy
    ActiveRecord::Base.connection.execute(
        "BEGIN;
        DELETE FROM animal_foods WHERE animal_foods.animal_id = '#{current_animal.id}';
        DELETE FROM animals WHERE animals.id = '#{current_animal.id}';
      COMMIT;"
    )
    flash[:success] = "Animal was deleted"
    redirect_to request.referrer || root_url
  end
 private

  def animal_params
    params.require(:animal).permit(:name, :animal_type_id)
  end
  def correct_user
    @animal = current_user.animals.find_by(id: params[:id])
    redirect_to root_url if @animal.nil?
  end
end
