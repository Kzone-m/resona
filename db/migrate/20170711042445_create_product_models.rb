class CreateProductModels < ActiveRecord::Migration[5.1]
  def change
    create_table :product_models do |t|
      t.references :instrument, foreign_key: true
      t.references :brand, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
