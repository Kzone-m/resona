class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.references :instrument, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
