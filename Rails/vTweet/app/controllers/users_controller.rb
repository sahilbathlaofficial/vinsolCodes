class UsersController < ApplicationController

  before_filter :set_user, :only => [:edit]

  def show
    if(current_user)
      @user = User.find(current_user)
    else
      respond_to do |format|
        format.html { redirect_to new_user_session_path }
      end
    end
  end

  protected

  def set_user
    @user = current_user
  end


end
