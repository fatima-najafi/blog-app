class UsersController < ApplicationController
  # The index action is responsible for displaying a list of users. It fetches all user records from the database
  # assigns them to an instance variable @users.
  # This instance variable can be accessed within the corresponding view file to display the list of users.
  def index
    @users = User.all
  end

  # the show action retrieves a user record from the database
  # based on the id parameter passed in the request (params[:id]).
  def show
    @user = User.find(params[:id])
  end

  def sign_out_user
    sign_out(current_user)
    redirect_to root_path, notice: 'Signed out successfully'
  end
end
