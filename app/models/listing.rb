class Listing < ApplicationRecord
  #belongs_to :profile
  belongs_to :buyer, class_name: "Profile", optional: true 
  belongs_to :seller, class_name: "Profile"
  has_one :location
  has_many_attached :images 

  # Validations 
  validates :title, :category, :price, presence: true
  validates :description, length: { maximum: 400, too_long: "has a maximun of %{count} charcaters!" }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

end
