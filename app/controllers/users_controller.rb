class UsersController < ApplicationController
    #hit count viewer
    impressionist
    
    def show
        begin
            @user = User.find(params[:id])
            @friends =  Friend.where(user_id: current_user.id).try(:all)
            if @user
                @is_me = @user.id == current_user.id ? true: false
            end
            
            if !@is_me
                @status =  current_user.status_with @user.id
                @friend =  Friend.where(user_id: current_user.id, friend_id: @user.id).try(:first) ||
                    Friend.where(user_id: @user.id, friend_id: current_user.id).try(:first)
            end
        rescue => ex
            @user = current_user
            @is_me = true
            @error = true
            logger.error ex.message
        end
    end
    
    def search
        @user = current_user
        @is_me = true
        @keyword = params[:name]
        @friends =  Friend.where(user_id: current_user.id).try(:all)
        if params[:name]
          @articles = User.search_db(params[:name]).order("created_at DESC")
        else
          @articles = User.order("created_at DESC")
        end
    end
    
end