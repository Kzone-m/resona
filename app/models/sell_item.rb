class SellItem < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  belongs_to :instrument
  belongs_to :brand
  belongs_to :condition
  has_many :images, dependent: :destroy, inverse_of: :sell_item
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :user_id, presence: true
  validates :instrument_id, presence: true
  validates :category_id, presence: true
  validates :brand_id, presence: true
  validates :product_model_id, presence: true
  validates :condition_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :listing_title, presence: true, length: { maximum: 140 }
  validates :price, numericality: { greater_than_or_equal_to: 1,  only_integer: true }

  # sellItem.errors.messages => {:price=>["must be greater than or equal to 0"]}
  # sellItem.errors.full_messages => ["Price must be greater than or equal to 0"]
end
