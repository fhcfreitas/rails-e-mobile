class Product < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_location_and_category,
  against: [ :location, :category ],
  using: {
    tsearch: { prefix: true }
  }
end
