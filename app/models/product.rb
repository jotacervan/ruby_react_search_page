class Product < ApplicationRecord
  searchkick
  belongs_to :country
  has_many :product_tags
  has_many :tags, through: :product_tags

  validates :name, :price, presence: true

  after_commit :create_search, on: :create
  after_commit :update_search, on: :update
  after_commit :destroy_search, on: :destroy

  def create_search
    SearchPage.create(id: self.id, title: self.name, description: self.description, price: self.price, country: self.country.name, tags: self.tags.map(&:name).join(', '))
  end

  def update_search
    SearchPage.find(self.id).update(title: self.name, description: self.description, price: self.price, country: self.country.name, tags: self.tags.map(&:name).join(', '))
  end

  def destroy_search
    SearchPage.destroy(self.id)
  end
end
