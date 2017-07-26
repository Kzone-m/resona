class CreateSellItems < ActiveRecord::Migration[5.1]
  def change
    create_table :sell_items do |t|
      t.references :user, foreign_key: true
      t.references :instrument, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :condition, foreign_key: true
      t.string :name
      t.string :listing_title
      t.integer :price

      t.timestamps
    end
  end
end
