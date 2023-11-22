class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :start_date, :finish_date, presence: true
end
