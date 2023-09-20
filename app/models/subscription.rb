class Subscription < ApplicationRecord
  belongs_to :customer
  validates :title, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :status, presence: true
  validates :frequency, presence: true
  enum :status, { inactive: 0, active: 1 }
end
