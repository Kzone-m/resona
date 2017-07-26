class User < ApplicationRecord
  has_many :sell_items
  has_many :carts
end
