class AddPremiumToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :premium,     :boolean, default: false, after: :admin, index: true
    add_column :users, :upgraded_at, :datetime
  end
end
