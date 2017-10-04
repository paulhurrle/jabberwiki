Rails.configuration.stripe = {
	publishable: ENV['STRIPE_PUBLISHABLE_KEY'],
	secret: ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = ENV['STRIPE_SECRET_KEY']