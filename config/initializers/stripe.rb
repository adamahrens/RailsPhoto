require 'stripe'

# Setup Stripe
  Stripe.api_key = Rails.application.credentials.stripe[:api_key]