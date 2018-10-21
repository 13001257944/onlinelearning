class ShareLearnsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_share_learn, only: [:show, :edit, :update, :destroy, :finish]

  def index
    @share_learns = ShareLearn.all
  end

  def show
  end

  def new
    @share_learn = ShareLearn.new
  end

  def edit
  end

  def create
    @share_learn = ShareLearn.new(share_learn_params)
    @share_learn.user_id = current_user.id
    respond_to do |format|
      if @share_learn.save
        format.html { redirect_to share_learns_path, notice: 'Share_learn was successfully created.' }
        format.json { render :show, status: :created, location: @share_learn }
      else
        format.html { render :new }
        format.json { render json: @share_learn.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if current_user.id == @share_learn.user_id
      respond_to do |format|
        if @share_learn.update(share_learn_params)
          format.html { redirect_to @share_learn, notice: 'Share_learn was successfully updated.' }
          format.json { render :show, status: :ok, location: @share_learn }
        else
          format.html { render :edit }
          format.json { render json: @share_learn.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    if current_user.id == @share_learn.user_id || current_user.id == 1
      @share_learn.destroy
      respond_to do |format|
        format.html { redirect_to share_learns_url, notice: 'Share_learn was successfully finish.' }
        format.json { head :no_content }
      end
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_learn
      @share_learn = ShareLearn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_learn_params
      params.require(:share_learn).permit(:title, :content)
    end


end
