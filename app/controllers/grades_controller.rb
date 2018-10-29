class GradesController < ApplicationController
  before_action :set_course 
  before_action :set_homework
  before_action :set_studenthomework 
  before_action :set_grade,only:[:destroy,:update,:show,:edit]

  def index
  end

  def show
  end

  def create
      @grade = @studenthomework.grades.build(grade_params)
      @grade.save!
      redirect_back(fallback_location: root_path)
  end

  
  def destroy
    @course = Course.find(params[:course_id])
    if current_user.id == @course.user_id
      @grade.destroy
      redirect_back(fallback_location: root_path)

    end
  end

  

  private

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

  def grade_params
    params.require(:grade).permit(:score)
  end

  def set_studenthomework
    @studenthomework = Studenthomework.find(params[:studenthomework_id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_homework
    @homework = Homework.find(params[:homework_id])
  end

  def set_grade
    @grade = Grade.find(params[:id])
  end

  

  
end
