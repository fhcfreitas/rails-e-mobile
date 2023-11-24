class Product < ApplicationRecord
  CATEGORY = ["E-Bike", "E-Scooter", "E-Motorbike", "Electric Car"]

  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_location_and_category,
  against: [ :location, :category ],
  using: {
    tsearch: { prefix: true }
  }

  validates :model, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true
  validates :category, presence: true
  validates :photo, presence: true
end
