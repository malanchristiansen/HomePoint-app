class Review < ApplicationRecord
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