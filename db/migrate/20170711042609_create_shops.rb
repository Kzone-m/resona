class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.string :logo

      t.timestamps
    end
  end
end
