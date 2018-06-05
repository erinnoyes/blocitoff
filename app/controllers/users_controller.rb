class UsersController < ApplicationController
  def show
    @user = current_user

    if @user.nil?
      redirect_to new_user_registration_path
    end 
  end
end
