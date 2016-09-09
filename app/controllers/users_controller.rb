class UsersController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  before_filter :load_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User was successfully updated.'
    end
    respond_with @user, location: users_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def load_user
    @user = User.find(params[:id])
  end
end
