class Review < ApplicationRecord
  #Reviews belongs to a listing it is writing about and belongs to a profile that is writing the review
  belongs_to :listing
  belongs_to :profile
  
  # Validations 
  validates :rating, presence: true
  validates :comment, length: { in: 5..100 }

  # before_save :check_whitespace
  def check_whitespace
    self.comment = self.description.strip
  end
end