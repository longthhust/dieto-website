class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @is_me = true
    if current_user
      @friends =  Friend.where(user_id: current_user.id).try(:all)
    end
  end
end
