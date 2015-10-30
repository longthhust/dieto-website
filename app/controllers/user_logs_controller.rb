class UserLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_log, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:show, :edit, :update, :destroy]

  # GET /user_logs
  # GET /user_logs.json
  def index
    #@user_logs = UserLog.all
    @user_logs = current_user.user_logs
  end

  # GET /user_logs/1
  # GET /user_logs/1.json
  def show
  end

  # GET /user_logs/new
  def new
    @user_log = UserLog.new user: current_user
  end

  # GET /user_logs/1/edit
  def edit
  end

  # POST /user_logs
  # POST /user_logs.json
  def create
    @user_log = UserLog.new(user_log_params.merge!({user: current_user}))

    respond_to do |format|
      if @user_log.save
        current_user.update_attribute(:weight, user_log_params[:weight])
        format.html { redirect_to @user_log, notice: 'User log was successfully created.' }
        format.json { render :show, status: :created, location: @user_log }
      else
        format.html { render :new }
        format.json { render json: @user_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_logs/1
  # PATCH/PUT /user_logs/1.json
  def update
    respond_to do |format|
      if @user_log.update(user_log_params)
        format.html { redirect_to @user_log, notice: 'User log was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_log }
      else
        format.html { render :edit }
        format.json { render json: @user_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_logs/1
  # DELETE /user_logs/1.json
  def destroy
    @user_log.destroy
    respond_to do |format|
      format.html { redirect_to user_logs_url, notice: 'User log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_log
      @user_log = UserLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_log_params
      params.require(:user_log).permit(:weight, :comment)
    end
    
    def correct_user
      @user = @user_log.user
      if (current_user != @user)
        redirect_to user_logs_path
        flash[:notice] = "他人のログを編集したり閲覧したりできません！"
      end
    end
end
