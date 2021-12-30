class Product < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true

    has_many :product_categories
    has_many :categories, through: :product_categories
    has_many :variants, class_name: 'ProductVariant'
    
end
