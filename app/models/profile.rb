class Profile < ApplicationRecord
  #Profile belongs to user 
  belongs_to :user
  #profiles can buy or sell products as many drone phptographs as they like. This is a self join and points to the listing model
  has_many :photographs_to_buy, class_name: "Listing", foreign_key: "buyer_id"
  has_many :photographs_to_sell, class_name: "Listing", foreign_key: "seller_id"
  #Profiles can write as many reviews as they'd like
  has_many :reviews 
  #Profiles can upload a photo 
  has_one_attached :avatar

  # Validations 
  validates :username, :first_name, presence: true
  validates :username, length: { in: 2..20 }
  validates :first_name, :last_name, length: { in: 2..50 }
  validates :bio, length: { maximum: 500, too_long: "%{count} is the maximum number of charcaters!" }

  # Sanitisation
  before_save :check_whitespace
  before_validation :validates_format_of

  def check_whitespace
    self.username = self.username.strip
    self.bio = self.bio.strip
  end

  def validates_format_of 
    if self.username.include?("!@#$%^&*)(':;")
      errors.add :base, :invalid, message: "Username cannot entail characters"
    end
  end 

end
