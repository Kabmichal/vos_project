class NotesController < ApplicationController
  def index
    @notes = Note.all
    @notes_by_day = @notes.group_by(&:date)
    @date = Date.today
    @note = Note.new(params[:note])
    @note = current_user.notes.build
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(animal_params)
    if @note.save
      redirect_to @note, notice: "Note created"
    else
      render :new
    end
  end
  def edit
    @note = Note.find(params[:id])
  end
end
private

def animal_params
  params.require(:note).permit(:note, :date)
end
