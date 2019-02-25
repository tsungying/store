class UsersController < ApplicationController
  before_action :authenticate_user!

  def upgrade_information
  end

  def upgrade
    if current_user.upgrade_to_premium
      redirect_to root_url, notice: 'Successfully upgraded.'
    else
      redirect_to upgrade_information_users_url, notice: 'Failed to upgrade, please contact your admin.'
    end
  end
end
