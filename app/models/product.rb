class Product < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_location_and_price_category,
  against: [ :location, :price, :category ],
  using: {
    tsearch: { prefix: true }
  }
end
