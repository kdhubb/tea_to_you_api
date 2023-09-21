class AddDefaultToSubscription < ActiveRecord::Migration[7.0]
  def change
    change_column :subscriptions, :status, :integer, default: 1
  end
end
