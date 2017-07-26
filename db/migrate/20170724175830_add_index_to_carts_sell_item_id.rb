class AddIndexToCartsSellItemId < ActiveRecord::Migration[5.1]
  def change
    add_index :carts, [:user_id, :sell_item_id], unique: true, name: 'cart_multi_index'
  end
end
