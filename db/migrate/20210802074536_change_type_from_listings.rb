class ChangeTypeFromListings < ActiveRecord::Migration[6.1]
  def change
    rename_column :listings, :type, :available
  end
end
