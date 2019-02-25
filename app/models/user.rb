class User < ApplicationRecord
  paginates_per 10
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def upgrade_to_premium
    self.premium = true
    self.upgraded_at = Time.now
    save
  end
end
