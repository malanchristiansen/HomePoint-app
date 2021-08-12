class Listing < ApplicationRecord
  #belongs_to :profile
  #Instead of saying belongs to profile, they belong to teh profile class, as it is a self join and don't have seperate models for buyer and seller
  belongs_to :buyer, class_name: "Profile", optional: true 
  belongs_to :seller, class_name: "Profile"

  #Listings can have one location
  has_one :location

  # Listings can have many reviews and be deleted with reviews as well
  has_many :reviews, dependent: :destroy

  #Listings can have many photos uploaded
  has_many_attached :images 

  # Validations 
  validates :title, :category, :price, presence: true
  validates :title, length: { in: 2..40 }
  validates :description, length: { maximum: 500, too_long: "has a maximun of %{count} charcaters!" }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # Sanitisation
  before_validation :check_title
  before_save :check_whitespace

  def check_title
    if self.title.length < 2 && !self.title.blank?
        errors.add :base, :invalid, message: "The title is too short!"
    end
  end

  def check_whitespace
    self.title = self.title.strip
    self.description = self.description.strip
  end

end
