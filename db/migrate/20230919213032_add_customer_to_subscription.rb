class AddCustomerToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_reference :subscriptions, :customer, foreign_key: true
  end
end
