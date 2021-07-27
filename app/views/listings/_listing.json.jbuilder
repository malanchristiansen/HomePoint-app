json.extract! listing, :id, :title, :description, :date_taken, :category, :type, :price, :profile_id, :buyer_id, :seller_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
