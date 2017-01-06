class FriendsController < ApplicationController
    # hit count viewer
    impressionist
    
    # GET /user_goals
    # GET /user_goals.json
    def index
        @user = current_user
        @is_me =  true
        @friends =  Friend.where(user_id: current_user.id).try(:all)
    end
    # GET /friends/1
    # GET /friends/1.json
    def show
        @user = current_user
        @is_me =  true
        @friends =  Friend.where(user_id: current_user.id).try(:all)
    end
    
    def create 
        Friend.create user_id: params[:user_id], friend_id: params[:friend_id]
        redirect_to user_path(id: params[:friend_id])
    end
    
    def destroy
        friend = Friend.find params[:id].to_i
        friend.destroy
        redirect_to user_path(id: params[:friend_id])
    end
    
    def update
        friend = Friend.find params[:id].to_i
        friend.update accepted: true
        redirect_to user_path(id: params[:friend_id])
    end
end
        