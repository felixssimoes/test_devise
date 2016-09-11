class UsersController < ApplicationController
  respond_to :html

  before_filter :load_user, only: [:edit, :update]

  def index
    @users = User.all
    authorize! :index, @users
  end

  def edit
    authorize! :update, @user
  end

  def update
    authorize! :update, @user
    if @user.update(user_params)
      flash[:success] = 'User was successfully updated.'
    end
    respond_with @user, location: users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :role)
  end

  def load_user
    @user = User.find(params[:id])
  end
end
