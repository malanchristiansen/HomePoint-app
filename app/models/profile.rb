class Profile < ApplicationRecord
  belongs_to :user
  has_many :photographs_to_buy, class_name: "Listing", foreign_key: "buyer_id"
  has_many :photographs_to_sell, class_name: "Listing", foreign_key: "seller_id"
  has_many :reviews 
  has_one_attached :avatar

  # Validations 
  validates :username, :first_name, presence: true
  validates :username, length: { in: 2..16 }
  validates :bio, length: { maximum: 500, too_long: "%{count} is the maximum number of charcaters!" }

end
