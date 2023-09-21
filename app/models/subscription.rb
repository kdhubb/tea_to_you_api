class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions
  validates :title, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :status, presence: true
  validates :frequency, presence: true
  enum :status, { inactive: 0, active: 1, cancelled: 3 }

  def tea_list
    teas.map do |tea|
      list_item = {}
      list_item[:tea_id] = tea.id
      list_item
    end
  end

  def save_teas(teas)
    teas.each do |tea|
      tea_object = Tea.find(tea[:tea_id])
      TeaSubscription.create!(subscription: self, tea: tea_object)
    end
  end

  def update_status(status)
    if status == 'cancelled'
      cancelled!
    elsif status == 'active'
      active!
    elsif status == 'inactive'
      inactive!
    end
  end
end
