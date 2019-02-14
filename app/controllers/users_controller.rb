class UsersController < ApplicationController
  def upgrade
    if current_user
      current_user.upgrade_to_premium
      redirect_to premiums_url, notice: 'Successfully upgraded.'
    else
      redirect_to new_user_registration_url
    end
  end
end
