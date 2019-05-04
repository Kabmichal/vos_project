class AnimalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show]
  before_action :correct_user, only: [:destroy]


  def index
    if params[:search]
      #@animals=Animal.joins(:animal_type).where('animal_type.name like ?', "%#{params[:name]}%")

     # @animals = Animal.search(params[:@animal_type.name]).order("created_at DESC")
      #
      @animals= Animal.joins(:animal_type).where("animals.name like ? or animal_types.animal_type like ?", "%#{params[:search]}%","%#{params[:search]}%").paginate(page: params[:page])

      #@results=Animal.joins(:animal_type)
      #@animals=Animal.joins(:animal_type).where('animal_types.animal_type like ?', "%#{params[:search]}%")
      #@animals = @results.search(params[:search]).order("created_at DESC")


      #animal_sql = "SELECT animal_types.id, animal_types.name, name FROM animals
	#	JOIN animal_types t ON t.id = animal_type_id"
                #       .where('t.name like ?', "%#{params[:search]}%")
     # @animals = Animal.search(params[:search]).order("created_at DESC")

   #   @animals = Animal.joins(:animal_type)
    #                 .where("animal_types.name OR amimals.name like ?", "%#{params[:search]}%")



      #@animals = Animal.search(params[:search]).order("created_at DESC")
     #@animals= Animal.all.order('created_at DESC')
    else
      @animals= Animal.all.order('created_at DESC').paginate(page: params[:page])
    end
  end
  def show
    @users = User.all
    @current_user = current_user
    calories = Food.joins(:user).where('foods.user_id = current_user.id')
    @animal = Animal.find(params[:id])
    session[:animal_id]= @animal.id
    @animal_foods = @animal.animal_foods.paginate(page: params[:page]).order('animal_foods.current_date DESC')
    @animal_food = current_animal.animal_foods.build
    @current_animal_food = current_animal.animal_foods
    #@count = @current_animal_food.count_by_sql("SELECT *
     #                            FROM animal_foods f
      #                           WHERE f.animal_id = #{@animal.id}
       #                          OR f.current_date = #{Date.today}
        #                         GROUP BY f.id,f.current_date
         #                        ORDER BY f.current_date DESC")
    @caloriesSql = ActiveRecord::Base.connection.exec_query("SELECT SUM(f.calories) * COUNT(f.id) as amount_of_calories FROM animal_foods af
      JOIN foods f on f.id = af.food_id WHERE af.animal_id = #{current_animal.id}
      GROUP BY f.id")
    @caloriesSql4 = ActiveRecord::Base.connection.exec_query("SELECT SUM(f.calories * af.count) FROM animal_foods af
      JOIN foods f on f.id = af.food_id WHERE af.animal_id = #{current_animal.id} GROUP BY  af.current_date")
    @caloriesSql=@caloriesSql.rows
    @caloriesSql3 = 3
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
    @animal.destroy
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
