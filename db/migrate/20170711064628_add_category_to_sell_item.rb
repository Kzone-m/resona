class AddCategoryToSellItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :sell_items, :category, foreign_key: true
  end
end
