class UsersController < ApplicationController
  def show
    if(current_user)
      @user = User.find(current_user)
    else
      respond_to do |format|
        format.html { redirect_to new_user_session_path }
      end
    end
  end
end
