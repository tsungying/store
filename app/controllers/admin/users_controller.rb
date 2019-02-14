class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  layout 'admin'

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      redirect_to [:admin, @user]
    else
      render 'edit'
    end
  end

  def authenticate_admin
    redirect_to root_url, alert: 'Not authorized.' unless current_user.admin
  end

  private

  def user_params
    params.require(:user).permit(:admin)
  end

end
