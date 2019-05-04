class HomesController < ApplicationController
  before_action :logged_in_user, only: [:create, :show]

  def home
    @home = current_user.homes.build if logged_in?
    @homes_items = current_user.homes.paginate(page: params[:page])
  end
  def index
    @homes= Home.all.order('created_at DESC').paginate(page: params[:page])
  end
  def show
    @home = current_user.homes.build if logged_in?
    @homes = current_user.homes.paginate(page: params[:page])
    @home = Home.find(params[:id])
    session[:home_id]= @home.id
    @home_enviroment = current_home.home_enviroments.build
  end
  def create
    @home = current_user.homes.build(home_params)
    if @home.save
      flash[:success] = 'Terrarium created'
      redirect_to homes_path
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
