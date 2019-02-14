class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :original_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :discount_price, presence: true, numericality: { only_integer: true, less_than_or_equal_to: :original_price }
end
