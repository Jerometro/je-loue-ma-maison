class House < ApplicationRecord
  belongs_to :users
  has_many :rentals
  has_one_attached :photo

  validates :address, :price_per_day, presence: true
end
