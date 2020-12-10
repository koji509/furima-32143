class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name 
    validates :explanation
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1, message: "Select" }do
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :area_id
  end

  validates :day_id,  numericality: { other_than: 1, message: "Select" }

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: "Half-width number" }do
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,  message: "Out of setting range" } 
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :status
  belongs_to :area
  belongs_to :day

end