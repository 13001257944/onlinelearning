class CoursereviewsController < ApplicationController
  before_action :set_course
  before_action :set_coursereview,  only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @coursereviews = Coursereview.all
  end

  def new
    @coursereview = Coursereview.new
  end

  def create
    @coursereview = @course.coursereviews.build(coursereview_params)
    @coursereview.user = current_user
    if @coursereview.save
      redirect_to course_coursetextbooks_url
    else
      render :action => :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if current_user.id == @coursereview.user_id
      if @coursereview.update_attributes(coursereview_params)
        redirect_to course_coursereview_path(@course,@coursereview)
      else
        render :action => :edit
      end
    end
  end

  def destroy
    if current_user.id == @coursereview.user_id
      @coursereview.destroy
      redirect_to course_coursereviews_url
    end    
  end

private
   
  def coursereview_params
    params.require(:coursereview).permit(:status,:review,:course_helpful,:course_easy,:course_learn,:cmap_helpful,
      :cmap_read,:cmap_learn,:studenthomework_helpful,:studentnote_helpful,:studentreview_helpful,:system_interface_easy,:onlinelearning_heipful,:system_function,:system_easyuse,:system_friend_interact,:system_friend_relationship,:system_overall )
  end

  def set_course
    @course = Course.find(params[:course_id])
    @courses = Course.all
  end

  def set_coursereview
    @coursereview = Coursereview.find(params[:id])
  end
end
