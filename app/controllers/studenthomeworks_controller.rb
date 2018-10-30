class StudenthomeworksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course 
  before_action :set_homework, except:[:index] 
  before_action :set_studenthomework ,only:[:destroy]

  def index
    @homeworks = Homework.all
    @studenthomeworks = Studenthomework.all
  end

  def create
      @studenthomework = @homework.studenthomeworks.build(studenthomework_params)
      @studenthomework.user = current_user
      @studenthomework.save!
      
  end
  def destroy
    @course = Course.find(params[:course_id])
    if current_user.id == @studenthomework.user_id ||current_user.id == @course.user_id
      @studenthomework.destroy
      redirect_to course_homework_path(@course,@homework)
    end
  end

  def favorite
    @studenthomework = Studenthomework.find(params[:id])
    @studenthomework.favorites.create!(user: current_user)
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end

  def unfavorite
    @studenthomework = Studenthomework.find(params[:id])
    favorites = Favorite.where(studenthomework: @studenthomework, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end

  private

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

  def studenthomework_params
    params.require(:studenthomework).permit(:description, :file, :status)
  end

  def homework_params
    params.require(:homework).permit(:id)
  end

  def set_studenthomework
    @studenthomework = Studenthomework.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_homework
    @homework = Homework.find(params[:homework_id])
  end
end
