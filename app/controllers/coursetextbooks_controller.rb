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

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_coursetextbook
    @coursetextbook = Coursetextbook.find(params[:id])
  end
  def coursetextbook_params
    params.require(:coursetextbook).permit(:title, :body, :code)
  end
  

  

end
