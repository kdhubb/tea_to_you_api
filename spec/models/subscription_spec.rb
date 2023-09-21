require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'associations' do
    it { should belong_to :customer }
    it { should have_many :tea_subscriptions }
    it { should have_many(:teas).through(:tea_subscriptions) }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_numericality_of :price }
    it { should validate_presence_of :status }
    it { should validate_presence_of :frequency }
  end

  describe 'instance methods' do
    before(:each) do
      @customer_1 = Customer.create!(first_name: 'Wolfie', last_name: 'Von Wiggles', email: 'wolfie@email.com',
                                     address: 'address')
      @sub_1 = @customer_1.subscriptions.create!(title: 'Best Tea Ever', price: 20.0, frequency: 'monthly')
      @sub_2 = @customer_1.subscriptions.create!(title: 'Tea for Mom', price: 18.0, frequency: 'monthly')
      @tea_1 = Tea.create!(title: 'Rose Green', description: 'Delicate floral', temperature: 130, brew_time: 4.0)
      @tea_2 = Tea.create!(title: 'Green Jasmine', description: 'Classic floral', temperature: 130, brew_time: 3.5)
      @tea_5 = Tea.create!(title: 'Earl Grey', description: 'Floral intense black tea', temperature: 200,
                           brew_time: 5.0)
      TeaSubscription.create!(subscription: @sub_1, tea: @tea_1)
      TeaSubscription.create!(subscription: @sub_1, tea: @tea_2)
      TeaSubscription.create!(subscription: @sub_1, tea: @tea_5)
    end

    it '#tea_list' do
      expected_1 = [{ tea_id: @tea_1.id }, { tea_id: @tea_2.id }, { tea_id: @tea_5.id }]
      expected_2 = []
      expect(@sub_1.tea_list).to eq(expected_1)
      expect(@sub_2.tea_list).to eq(expected_2)
    end

    it '#save_teas' do
      teas = [{ tea_id: @tea_1.id }, { tea_id: @tea_2.id }]

      expect(@sub_2.teas.count).to eq(0)
      @sub_2.save_teas(teas)

      expect(@sub_2.teas.count).to eq(2)
      expect(@sub_2.teas).to match_array([@tea_1, @tea_2])
    end

    it '#update_status' do
      expect(@sub_1.status).to eq('active')
      @sub_1.update_status('cancelled')
      expect(@sub_1.status).to eq('cancelled')
      @sub_1.update_status('inactive')
      expect(@sub_1.status).to eq('inactive')
      @sub_1.update_status('active')
      expect(@sub_1.status).to eq('active')
    end
  end
end
