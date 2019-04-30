class HomesController < ApplicationController
  before_action :logged_in_user, only: [:create, :show]

  def home
    @home = current_user.homes.build if logged_in?
  end
  def show

  end
  def create
    @home = current_user.homes.build(home_params)
    if @home.save
      flash[:success] = 'Terrarium created'
      redirect_to root_url
    else
      flash.now[:error] = "Could not create terrarium"
    end
  end
  private

  def home_params
    params.require(:home).permit(:name, :user_id, :size)
  end
  def correct_user
    @home = current_user.homes.find_by(id: params[:id])
    redirect_to root_url if @home.nil?
  end
end
