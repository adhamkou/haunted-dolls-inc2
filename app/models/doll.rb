class Doll < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :image
  validates :name, :description, :price, :location, :image, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
  against: [ :name, :location ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
