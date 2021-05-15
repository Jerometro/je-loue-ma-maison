class Rental < ApplicationRecord
  belongs_to :users
  belongs_to :houses
  validates :start_date, :end_date, presence: true
end
