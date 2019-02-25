class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_user, only: [:show, :edit, :update]

  layout 'admin'

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
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

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:admin, :email)
  end

end
