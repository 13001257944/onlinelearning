class HomeworksController < ApplicationController
  before_action :set_course
  before_action :set_homework, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user!
  def index
    @homeworks = Homework.all
  end

  def new
    @homework = Homework.new
  end

  def create
    @homework = @course.homeworks.build(homework_params)
    if @homework.save
      redirect_to course_coursetextbooks_url
    else
      render :action => :new
    end
  end

  def show
    @studenthomework = Studenthomework.new
  end

  def edit
  end

  def update
    if @homework.update_attributes(homework_params)
      redirect_to course_homework_path(@course,@homework)
    else
      render :action => :edit
    end
  end

  def destroy
    @homework.destroy

    redirect_to course_coursetextbooks_url
  end

  
  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_homework
    @homework = Homework.find(params[:id])
  end
  def homework_params
    params.require(:homework).permit(:name, :description, :file)
  end
  

end
