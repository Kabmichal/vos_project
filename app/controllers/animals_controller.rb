class AnimalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show]
  before_action :correct_user, only: [:destroy]

  def connect
  end
  def index
    if params[:search]
      #@animals=Animal.joins(:animal_type).where('animal_type.name like ?', "%#{params[:name]}%")

     # @animals = Animal.search(params[:@animal_type.name]).order("created_at DESC")
      #
      @animals= Animal.joins(:animal_type).where("animals.name like ? or animal_types.animal_type like ?", "%#{params[:search]}%","%#{params[:search]}%")

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
      @animals= Animal.all.order('created_at DESC')
    end
  end
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
