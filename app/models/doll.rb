class Doll < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :description, :price, :location, :image, presence: true
end
