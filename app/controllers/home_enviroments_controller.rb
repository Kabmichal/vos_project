class HomeEnviromentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show]

  def show
    index = params[:id]
    @home_enviroments = HomeEnviroment.find_by_sql(
        "SELECT *
        FROM home_enviroments h
        WHERE h.id = '#{index}'").first
    session[:home_enviroment_id]= @home_enviroment.id
  end
  def create
    @home_enviroment = current_home.home_enviroments.build(home_enviroment_params)
    if @home_enviroment.save
      flash[:success] = 'Enviroment created'
      redirect_to request.referer
    else
      flash.now[:error] = "Could not create enviroment"
      render 'animals/animal_form'
    end
  end
  private
  def correct_user
    @home_enviroment = current_home.home_enviroments.find_by(id: params[:id])
    redirect_to root_url if @home_enviroment.nil?
  end
  def home_enviroment_params
    params.require(:home_enviroment).permit(:humidity, :temperature, :date, :time)
  end
end
