class CommentsController < ApplicationController
    before_action :set_course 
    before_action :set_coursetextbook 
    before_action :set_comment ,only:[:destroy]


  def create
    @comment = @coursetextbook.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to course_coursetextbook_path(@course,@coursetextbook)
  end
  def destroy
    @course = Course.find(params[:course_id])
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to course_coursetextbook_path(@course,@coursetextbook)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def coursetextbook_params
    params.require(:coursetextbook).permit(:id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_coursetextbook
    @coursetextbook = Coursetextbook.find(params[:coursetextbook_id])
  end
end
