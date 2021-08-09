class HomeController < ApplicationController
  def page
  end

  def drones
    @listings = Listing.order(created_at: :desc).includes(:images_attachments)
  end

  def show_category(category)
      return Listing.order(created_at: :desc).where(category: category).includes(:images_attachments)
  end

  def cities 
    @listings = show_category("Cities")
  end

  def nature 
    @listings = show_category("Nature")
  end

  def ocean 
    @listings = show_category("Ocean")
  end

  def objects
    @listings = show_category("Objects")
  end

  def other
    @listings = show_category("Other")
  end

end
