class Doll < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :image
  validates :name, :description, :price, :location, :image, presence: true
end
