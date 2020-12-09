class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true # with: /\A[0-9]+\z/, message: "Price Half-width number"
  validates :image, presence:true

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to :category
  belongs_to :delivery
  belongs_to :status
  belongs_to :area
  belongs_to :day

  validates :category_id, numericality: { other_than: 1 } 
  validates :delivery_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
end