class CourseregistionsController < ApplicationController
  before_action :authenticate_user!



  def create
    @course = Course.find(params[:course_id])
    @courseregistion = @course.courseregistions.build(course_id: params[:course_id])
    @courseregistion.user = current_user
    @courseregistion.save!
    redirect_to course_path(@course)
  end

  def destroy
    @course = Course.find(params[:course_id])
    @courseregistion = Courseregistion.find(params[:id])
    if current_user.id == @courseregistion.user_id
      @courseregistion.destroy
      redirect_to course_courseregistion_path(@course,@courseregistion)
    end
  end

  private

  

  def course_params
    params.require(:course).permit(:id)
  end

  

end
