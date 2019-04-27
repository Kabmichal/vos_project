class AnimalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show]
  before_action :correct_user, only: [:destroy]

  def show
    @animal = Animal.find(params[:id])
    session[:animal_id]= @animal.id
    @animal_foods = @animal.animal_foods.paginate(page: params[:page])
    @animal_food = current_animal.animal_foods.build
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
