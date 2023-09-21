require 'rails_helper'

RSpec.describe 'Cancel Subscription', type: :request do
  describe "cancel a customer's subscription" do
    before(:each) do
      @customer_1 = Customer.create!(first_name: 'Wolfie', last_name: 'Von Wiggles', email: 'wolfie@email.com',
                                     address: 'address')
      @sub_1 = @customer_1.subscriptions.create!(title: 'Best Tea Ever', price: 20.0, frequency: 'monthly')
      @sub_2 = @customer_1.subscriptions.create!(title: 'Tea for Mom', price: 18.0, frequency: 'monthly')
      @tea_1 = Tea.create!(title: 'Rose Green', description: 'Delicate floral', temperature: 130, brew_time: 4.0)
      @tea_2 = Tea.create!(title: 'Green Jasmine', description: 'Classic floral', temperature: 130, brew_time: 3.5)
      @tea_3 = Tea.create!(title: 'Sencha', description: 'Woody green', temperature: 130, brew_time: 4.0)
      @tea_5 = Tea.create!(title: 'Earl Grey', description: 'Floral intense black tea', temperature: 200,
                           brew_time: 5.0)
      @tea_7 = Tea.create!(title: 'Rooibos Chai', description: 'Relaxing dessert tea', temperature: 150, brew_time: 5.0)
      TeaSubscription.create!(subscription: @sub_1, tea: @tea_1)
      TeaSubscription.create!(subscription: @sub_1, tea: @tea_2)
      TeaSubscription.create!(subscription: @sub_1, tea: @tea_5)
      TeaSubscription.create!(subscription: @sub_2, tea: @tea_1)
      TeaSubscription.create!(subscription: @sub_2, tea: @tea_3)
      TeaSubscription.create!(subscription: @sub_2, tea: @tea_7)
    end
    it "can cancel a subscription" do
      expect(@sub_1.status).to eq("active")

      subscription_params = {
        customer_id: @customer_1.id,
        status: "cancelled"
      }
      patch api_v1_subscription_path(@sub_1), params: subscription_params

      parsed = JSON.parse(response.body, symbolize_names: true)

      @sub_1.reload
      
      expect(@sub_1.status).to eq("cancelled")
      expect(response.code).to eq('200')
      expect(parsed[:data][:id]).to eq("#{@sub_1.id}")
      expect(parsed[:data][:type]).to eq("subscription")
      expect(parsed[:data][:attributes][:customer_id]).to eq(@customer_1.id)
      expect(parsed[:data][:attributes][:title]).to eq(@sub_1.title)
      expect(parsed[:data][:attributes][:price]).to eq(@sub_1.price)
      expect(parsed[:data][:attributes][:status]).to eq("cancelled")
      expect(parsed[:data][:attributes][:frequency]).to eq(@sub_1.frequency)
      expect(parsed[:data][:attributes][:teas]).to eq(@sub_1.tea_list)
    end
  end
end
