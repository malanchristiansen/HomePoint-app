class Profile < ApplicationRecord
  belongs_to :user
  has_many :photographs_to_buy, class_name: "Listing", foreign_key: "buyer_id"
  has_many :photographs_to_sell, class_name: "Listing", foreign_key: "seller_id"
  has_many :reviews 
  has_one_attached :avatar

  # Validations 
  validates :username, :first_name, presence: true
  validates :username, length: { in: 2..20 }
  validates :first_name, :last_name, length: { in: 2..50 }
  validates :bio, length: { maximum: 500, too_long: "%{count} is the maximum number of charcaters!" }

  # Sanitisation
  # before_save :check_whitespace, :validates_format_of

  # def check_whitespace
  #   self.username = self.username.strip
  #   self.bio = self.bio.strip
  # end

  # def validates_format_of 
  #   if self.username.includes("#")
  #     errors.add :base, :invalid, message: "The title is too short!"
  #   end
  # end 

end
