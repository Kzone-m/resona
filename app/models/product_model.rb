class ProductModel < ApplicationRecord
  belongs_to :instrument
  belongs_to :brand
end
