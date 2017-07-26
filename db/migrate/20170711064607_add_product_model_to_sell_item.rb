class AddProductModelToSellItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :sell_items, :product_model, foreign_key: true
  end
end
