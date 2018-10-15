class NotesController < ApplicationController
  before_action :set_course 
  before_action :set_coursetextbook 
  before_action :set_note ,only:[:destroy,:update,:show,:edit]
  before_action :authenticate_user!


  def show
  end
  def create
      @note = @coursetextbook.notes.build(note_params)
      @note.user = current_user
      @note.save!
      # redirect_to course_coursetextbook_path(@course,@coursetextbook)
  end
  def destroy
    @course = Course.find(params[:course_id])
    if current_user.id == @note.user_id
      @note.destroy
      redirect_to course_coursetextbook_path(@course,@coursetextbook)

    end
  end

  def update
    if current_user.id == @note.user_id
      if @note.update_attributes(note_params)
      else
        render :action => :edit
      end
    end
  end

  def edit
  end

  private

  def note_params
    params.require(:note).permit(:content,:status)
  end

  def coursetextbook_params
    params.require(:coursetextbook).permit(:id)
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_coursetextbook
    @coursetextbook = Coursetextbook.find(params[:coursetextbook_id])
  end

  def authenticate_admin
     unless current_user.admin?
       flash[:alert] = "Not allow!"
       redirect_to root_path
     end
   end
end
