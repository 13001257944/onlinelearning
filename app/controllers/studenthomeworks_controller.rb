class StudenthomeworksController < ApplicationController
  before_action :set_course 
  before_action :set_homework 
  before_action :set_studenthomework ,only:[:destroy]


  def create
      @studenthomework = @homework.studenthomeworks.build(studenthomework_params)
      @studenthomework.user = current_user
      @studenthomework.save!
  end
  def destroy
    @course = Course.find(params[:course_id])
    if current_user.id == @studenthomework.user_id
      @studenthomework.destroy
    end
  end

  private

  def studenthomework_params
    params.require(:studenthomework).permit(:file)
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
