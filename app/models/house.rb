class House < ApplicationRecord
  belongs_to :users
  has_many :rentals
  validates :address, :price_per_day, presence: true
end
