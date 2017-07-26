class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :sell_item
  validates :user_id, :uniqueness => {:scope => :sell_item_id}
end
