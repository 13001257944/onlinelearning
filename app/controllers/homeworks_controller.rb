class HomeworksController < ApplicationController
  before_action :set_course
  before_action :set_homework, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user!
  def index
    if current_user.id == @course.user_id
      @homeworks = Homework.all
      @studenthomeworks = Studenthomework.all
      @grades = Grade.all

    end
  end

  def new
    if current_user.id == @course.user_id
     @homework = Homework.new
    end
  end

  def create
    if current_user.id == @course.user_id
      @homework = @course.homeworks.build(homework_params)
      if @homework.save
        redirect_to course_coursetextbooks_url
      else
        render :action => :new
      end
    end
  end

  def show
      @studenthomework = Studenthomework.new
      @grade = Grade.new
  end

  def edit
  end

  def update
    if current_user.id == @course.user_id
      if @homework.update_attributes(homework_params)
        redirect_to course_homework_path(@course,@homework)
      else
        render :action => :edit
      end
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
  
  def authenticate_admin
     unless current_user.admin?
       flash[:alert] = "Not allow!"
       redirect_to root_path
     end
   end


end
