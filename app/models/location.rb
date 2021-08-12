class Location < ApplicationRecord
  #A location belongs to a listing
  belongs_to :listing
end
