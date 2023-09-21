class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions
  validates :title, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :status, presence: true
  validates :frequency, presence: true
  enum :status, { inactive: 0, active: 1 }

  def tea_list
    list = teas.map do |tea|
      list_item = Hash.new
      list_item[:tea_id] = tea.id
      list_item
    end
  end
end
