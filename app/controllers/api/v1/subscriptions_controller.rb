class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    return unless customer

    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def create
    customer = Customer.find(params[:customer_id])
    return unless customer

    subscription = customer.subscriptions.new(subscription_params)
    if subscription.save
      subscription.save_teas(params[:teas])
      render json: SubscriptionSerializer.new(subscription)
    else
      render json: ErrorSerializer.new(error_message(subscription.errors)).bad_request, status: :bad_request
    end
  end

  def update
    customer = Customer.find(params[:customer_id])
    return unless customer

    subscription = Subscription.find(params[:subscription_id])
    subscription.update_status(params[:status])
    render json: SubscriptionSerializer.new(subscription)
  end

  private

  def subscription_params
    params.permit(:title, :price, :frequency)
  end
end
