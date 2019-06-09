class Product < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :tax_class
  has_and_belongs_to_many :categories
end
