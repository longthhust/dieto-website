class ActivityLogsController < ApplicationController
  before_action :set_activity_log, only: [:show, :edit, :update, :destroy]

  # GET /activity_logs
  # GET /activity_logs.json
  def index
    @user_goals = current_user.user_goals
    @user = current_user
    @activity_logs = ActivityLog.where(user_id: current_user.id).try(:all)
    @is_me = true
  end

  # GET /activity_logs/1
  # GET /activity_logs/1.json
  # def show
  #   @user = current_user
  # end

  # GET /activity_logs/new
  # def new
  #   @user = current_user
  #   @activity_log = ActivityLog.new
  # end

  # GET /activity_logs/1/edit
  # def edit
  #   @user = current_user
  # end

  # POST /activity_logs
  # POST /activity_logs.json
  def create
    @user = current_user
    @activity_log = ActivityLog.new(activity_log_params)

    respond_to do |format|
      if @activity_log.save
        format.html { redirect_to @activity_log, notice: 'Activity log was successfully created.' }
        format.json { render :show, status: :created, location: @activity_log }
      else
        format.html { render :new }
        format.json { render json: @activity_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_logs/1
  # PATCH/PUT /activity_logs/1.json
  def update
    respond_to do |format|
      if @activity_log.update(activity_log_params)
        format.html { redirect_to @activity_log, notice: 'Activity log was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_log }
      else
        format.html { render :edit }
        format.json { render json: @activity_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_logs/1
  # DELETE /activity_logs/1.json
  def destroy
    @activity_log.destroy
    respond_to do |format|
      format.html { redirect_to activity_logs_url, notice: 'Activity log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_log
      @activity_log = ActivityLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_log_params
      params.require(:activity_log).permit(:user_id, :content)
    end
end
