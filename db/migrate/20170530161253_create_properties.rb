class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :bedrooms
      t.float :bathrooms
      t.integer :zipcode
      t.integer :price
      t.boolean :rent
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.float :longitude
      t.float :latitude
      t.integer :sq_ft

      t.timestamps null: false
    end
  end
end
