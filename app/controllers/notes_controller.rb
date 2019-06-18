class NotesController < ApplicationController
  before_action :correct_user,   only: :destroy

  def index
    @notes = Note.all
    @current_user = current_user
    @notes_by_day = @notes.where("notes.user_id = #{current_user.id}").group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @note = Note.new(params[:note])
    @note = current_user.notes.build
  end

  def show
    @note = Note.find(params[:id])
    @note_items= Note.where("notes.user_id = #{current_user.id}").order('created_at DESC').paginate(page: params[:page],per_page: 8)
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(animal_params)
    if @note.save
      redirect_to notes_path, notice: "Note created"
    else
      render :new
    end
  end
  def edit
    @note = Note.find(params[:id])
  end

  def destroy
    @note.destroy
    flash[:success] = "Note was deleted"
    redirect_to notes_path
  end
end
private
def correct_user
  @note = current_user.notes.find_by(id: params[:id])
  redirect_to notes_path if @note.nil?
end
def animal_params
  params.require(:note).permit(:note, :date)
end
