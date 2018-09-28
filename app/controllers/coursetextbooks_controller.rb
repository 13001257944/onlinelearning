class CoursetextbooksController < ApplicationController
  before_action :set_course
  before_action :set_coursetextbook, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user!
  def index
    @coursetextbooks = Coursetextbook.all
  end

  def new
    @coursetextbook = Coursetextbook.new
  end

  def create
    if current_user.id == @course.user_id
      @coursetextbook = @course.coursetextbooks.build(coursetextbook_params)
      if @coursetextbook.save
        redirect_to course_coursetextbooks_url
      else
        render :action => :new
      end
    end
  end

  def show
      @comment = Comment.new
  end

  def edit
  end

  def update
    if current_user.id == @course.user_id
      if @coursetextbook.update_attributes(coursetextbook_params)
        redirect_to course_coursetextbook_path(@course,@coursetextbook)
      else
        render :action => :edit
      end
    end
  end

  def destroy
    if current_user.id == @course.user_id
      @coursetextbook.destroy
      redirect_to course_coursetextbooks_url
    end    
  end

  def finish
    @coursetextbook = Coursetextbook.find(params[:id])
    @coursetextbook.finishcoursetextbooks.create!(user: current_user)
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end

  def notfinish
    @coursetextbook = Coursetextbook.find(params[:id])
    finishcoursetextbooks = Finishcoursetextbook.where(coursetextbook: @coursetextbook, user: current_user)
    finishcoursetextbooks.destroy_all
    redirect_back(fallback_location: root_path)
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
    @courses = Course.all
  end

  def set_coursetextbook
    @coursetextbook = Coursetextbook.find(params[:id])
  end
  def coursetextbook_params
    params.require(:coursetextbook).permit(:title, :body, :code, :id,:status)
  end
  
  def authenticate_admin
     unless current_user.admin?
       flash[:alert] = "Not allow!"
       redirect_to root_path
     end
   end


  

end
