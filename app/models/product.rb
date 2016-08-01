class Product < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
end
