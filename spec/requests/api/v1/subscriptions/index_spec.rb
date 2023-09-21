require 'rails_helper'

RSpec.describe 'Subscriptions Index', type: :request do
  describe "get all a customer's tea subscriptions" do
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
    it "can get all customer's subscriptions happy path" do
      subscription_params = { customer_id: @customer_1.id }
      get api_v1_subscriptions_path, params: subscription_params

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response.code).to eq('200')
      expect(parsed[:data].first[:id]).to eq("#{@sub_1.id}")
      expect(parsed[:data].first[:type]).to eq('subscription')
      expect(parsed[:data].first[:attributes][:customer_id]).to eq(@customer_1.id)
      expect(parsed[:data].first[:attributes][:title]).to eq("#{@sub_1.title}")
      expect(parsed[:data].first[:attributes][:price]).to eq(@sub_1.price)
      expect(parsed[:data].first[:attributes][:status]).to eq("#{@sub_1.status}")
      expect(parsed[:data].first[:attributes][:frequency]).to eq("#{@sub_1.frequency}")
      expect(parsed[:data].first[:attributes][:teas]).to be_an(Array)
      expect(parsed[:data].first[:attributes][:teas].first[:tea_id]).to eq(@tea_1.id)
      expect(parsed[:data].count).to eq(2)
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
