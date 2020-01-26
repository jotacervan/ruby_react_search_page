class Product < ApplicationRecord
  belongs_to :country
  has_many :product_tags
  has_many :tags, through: :product_tags

  validates :name, :price, presence: true
end
