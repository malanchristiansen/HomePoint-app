class Profile < ApplicationRecord
  belongs_to :user
  has_many :photographs_to_buy, class_name: "Listing", foreign_key: "buyer_id"
  has_many :photographs_to_sell, class_name: "Listing", foreign_key: "seller_id"

  has_many :reviews 
end
