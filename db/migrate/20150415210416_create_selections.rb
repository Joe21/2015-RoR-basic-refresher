class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.string :name, unique: true
      t.string :category
      t.text :description
      t.decimal :cost, precision: 8, scale: 2
      t.decimal :price, precision: 8, scale: 2
      t.string :image_url
      t.timestamps null: false
    end
  end
end