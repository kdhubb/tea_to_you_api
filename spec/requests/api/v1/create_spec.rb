require 'rails_helper'

RSpec.describe 'New Subscription', type: :request do
  describe "subscribe a customer to a new subscription" do
    before(:each) do
      @customer_1 = Customer.create!(first_name: 'Wolfie', last_name: 'Von Wiggles', email: 'wolfie@email.com',
                                     address: 'address')
      
      @tea_1 = Tea.create!(title: 'Rose Green', description: 'Delicate floral', temperature: 130, brew_time: 4.0)
      @tea_2 = Tea.create!(title: 'Green Jasmine', description: 'Classic floral', temperature: 130, brew_time: 3.5)
      @tea_3 = Tea.create!(title: 'Sencha', description: 'Woody green', temperature: 130, brew_time: 4.0)
      @tea_5 = Tea.create!(title: 'Earl Grey', description: 'Floral intense black tea', temperature: 200,
                           brew_time: 5.0)
      @tea_7 = Tea.create!(title: 'Rooibos Chai', description: 'Relaxing dessert tea', temperature: 150, brew_time: 5.0)
    end
    it "can create a new subscription" do
      subscription_params = {
        customer_id: @customer_1.id,
        title: "Test Subscription 1",
        price: 15.00,
        frequency: "monthly",
        teas: [
          {
            tea_id: @tea_1.id
          },
          {
            tea_id: @tea_2.id
          }
        ] 
      }
      post api_v1_subscriptions_path, params: subscription_params

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response.code).to eq('200')
      expect(parsed[:data][:id]).to eq("#{Subscription.last.id}")
      expect(parsed[:data][:type]).to eq("subscription")
      expect(parsed[:data][:attributes][:customer_id]).to eq(@customer_1.id)
      expect(parsed[:data][:attributes][:title]).to eq(subscription_params[:title])
      expect(parsed[:data][:attributes][:price]).to eq(subscription_params[:price])
      expect(parsed[:data][:attributes][:status]).to eq("active")
      expect(parsed[:data][:attributes][:frequency]).to eq(subscription_params[:frequency])
      expect(parsed[:data][:attributes][:teas]).to eq(subscription_params[:teas])
    end

    it "get all customer's subscriptions sad path" do
      subscription_params = { customer_id: 3 }
      get api_v1_subscriptions_path, params: subscription_params

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response.code).to eq('404')
      expect(parsed[:errors].first[:status]).to eq('404')
      expect(parsed[:errors].first[:title]).to eq("Couldn't find Customer with 'id'=3")
    end
  end
end
