class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.date :date_taken
      t.string :category
      t.string :type
      t.float :price
      t.references :profile, foreign_key: true
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
