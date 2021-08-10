Rails.configuration.stripe = {
    :api_key => ENV['STRIPE_SECRET_KEY']
}
Stripe.api_key = Rails.configuration.stripe[:stripe_api_key]