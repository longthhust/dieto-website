class UserGoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_goal, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:show, :edit, :update, :destroy]

  # GET /user_goals
  # GET /user_goals.json
  def index
    #@user_goals = UserGoal.all
    @user_goals = current_user.user_goals
  end

  # GET /user_goals/1
  # GET /user_goals/1.json
  def show
  end

  # GET /user_goals/new
  def new
    @user_goal = UserGoal.new user: current_user
  end

  # GET /user_goals/1/edit
  def edit
  end

  # POST /user_goals
  # POST /user_goals.json
  def create
    @user_goal = UserGoal.new(user_goal_params.merge!({user: current_user}))

    respond_to do |format|
      if @user_goal.save
        format.html { redirect_to @user_goal, notice: 'User goal was successfully created.' }
        format.json { render :show, status: :created, location: @user_goal }
      else
        format.html { render :new }
        format.json { render json: @user_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_goals/1
  # PATCH/PUT /user_goals/1.json
  def update
    respond_to do |format|
      if @user_goal.update(user_goal_params)
        format.html { redirect_to @user_goal, notice: 'User goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_goal }
      else
        format.html { render :edit }
        format.json { render json: @user_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_goals/1
  # DELETE /user_goals/1.json
  def destroy
    @user_goal.destroy
    respond_to do |format|
      format.html { redirect_to user_goals_url, notice: 'User goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_goal
      @user_goal = UserGoal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_goal_params
      params.require(:user_goal).permit(:weight, :deadline, :comment)
    end
    
    def correct_user
      @user = @user_goal.user
      if (current_user != @user)
        redirect_to user_goals_path
        flash[:notice] = "他人の目標を編集したり閲覧したりできません！"
      end
    end
end
