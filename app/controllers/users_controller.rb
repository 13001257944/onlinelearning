class UsersController < ApplicationController
  layout"selflearn"
  before_action :authenticate_user!
  before_action :set_course ,:set_coursetextbook ,:set_comment ,:set_homework,:set_courseregistion ,:set_studenthomework
  before_action :set_user, only: [:show, :edit, :update]
  def index
    @users = User.all
  end

  def show
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
   def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
   def set_user
    @user = User.find(params[:id])
   end 

   def user_params
    params.require(:user).permit(:name, :intro, :avatar)
   end

   def authenticate_admin
     unless current_user.admin?
       flash[:alert] = "Not allow!"
       redirect_to root_path
     end
   end
   def set_course
    
    @courses = Course.all
  end

  def set_coursetextbook
    
    @coursetextbooks = Coursetextbook.all
  end

  def set_homework
    
    @homeworks = Studenthomework.all
  end

  def set_studenthomework
    
    @studenthomeworks = Studenthomework.all
  end

  def set_comment
    
    @comments = Comment.all
  end

  def set_courseregistion
    @courseregistions = Courseregistion.all
  end

end
