class FoodsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show]
  before_action :correct_user,   only: :destroy

  def show
    index = params[:id]
    @food = Food.find_by_sql(
        "SELECT *
        FROM foods f
        WHERE f.id = '#{index}'").first
    session[:food_id]= @food.id
  end
  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      flash[:success] = 'Food created'
      redirect_to root_url
    else
      flash.now[:error] = "Could not create animal"
      render 'animals/animal_form'
    end
  end
  def destroy
    @food.destroy
    flash[:success] = "Animal was deleted"
    redirect_to request.referrer || root_url
  end
  private
  def correct_user
    @food = current_user.foods.find_by(id: params[:id])
    redirect_to root_url if @food.nil?
  end
  def food_params
    params.require(:food).permit(:name, :calories)
  end

end
