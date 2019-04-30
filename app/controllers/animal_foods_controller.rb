class AnimalFoodsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def animal_food_name
    @animal_food_n= AnimalFood.joins(:foods).where("animal_foods.food_id = foods.id")
    @food_name= @animal_food_n.where(id: animal_food.food_id).first.name
  end
  def create_food
    AnimalFood.transaction do
      Food.transaction do

      end

    end
  end

  def create
    @animal_food = current_animal.animal_foods.build(animal_food_params)
    if @animal_food.save
      flash[:success] = "Note created!"
      redirect_to request.referer
    else
      flash[:danger] = "Count cant be nill"
      redirect_to root_path
    end
  end

  def destroy
    @animal_food.destroy
    flash[:success] = "Food was deleted"
    redirect_to request.referer
  end

  private
  def correct_user
    @animal_food = current_animal.animal_foods.find_by(id: params[:id])
    redirect_to root_url if @animal_food.nil?
  end
  def animal_food_params
    params.require(:animal_food).permit(:count, :current_date, :time, :food_id)
  end
end
