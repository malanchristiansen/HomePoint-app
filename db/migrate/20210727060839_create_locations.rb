class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :city
      t.integer :postcode
      t.string :state
      t.string :country
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
