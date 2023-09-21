class Api::V1::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    if customer
      render json: SubscriptionSerializer.new(customer.subscriptions)
    else
      render json: { error: "customer not found" }
    end
  end

  def create

  end

  def update

  end
end