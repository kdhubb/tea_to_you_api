class Tea < ApplicationRecord
  has_many :tea_subscriptions
  has_many :subscriptions, through: :tea_subscriptions
  validates :title, presence: true
  validates :description, presence: true
  validates :temperature, presence: true
  validates :temperature, numericality: true
  validates :brew_time, presence: true
  validates :brew_time, numericality: true
end
