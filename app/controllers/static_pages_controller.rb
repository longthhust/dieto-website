class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @is_me = true
  end
end
