class HomeController < ApplicationController
  def page
  end

  def drones
    @listings = Listing.order(created_at: :desc)
  end

  def cities 
    @listings = Listing.order(created_at: :desc).where(category: "Cities")
  end 

  def nature 
    @listings = Listing.order(created_at: :desc).where(category: "Nature")
  end 

  def ocean 
    @listings = Listing.order(created_at: :desc).where(category: "Ocean")
  end 

  def objects 
    @listings = Listing.order(created_at: :desc).where(category: "Objects")
  end 

  def other 
    @listings = Listing.order(created_at: :desc).where(category: "Other")
  end 

end
