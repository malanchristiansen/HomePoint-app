class PaymentController < ApplicationController
  def create 
    @listing = Listing.find(params[:photograph_id])

    if ENV['RAILS_ENV'] == "development"
      root_path = "http://localhost:3000"
      Stripe.api_key = Rails.application.credentials.dig(:stripe, :stripe_api_key)
    else 
      root_path = ENV['ROOT_PATH']
      Stripe.api_key = Rails.configuration.stripe[:stripe_api_key]
    end

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'aud',
          product_data: {
            name: "Drone shot: #{@listing.title}",
          },
          unit_amount: @listing.price.to_i * 100,
        },
        quantity: 1,
      }],
      mode: 'payment',
      # These placeholder URLs will be replaced in a following step.
      success_url: "#{root_path}/listings/#{@listing.id}?checkout=success",
      cancel_url: "#{root_path}/payment/cancel",
    })
    redirect_to session.url
  end

  def cancel
    render file: 'public/404.html', layout: false, status: :not_found
  end
  
end
