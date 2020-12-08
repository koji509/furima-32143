class Product < ApplicationRecord
  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one :purchase
  has_one_attached :image

end
