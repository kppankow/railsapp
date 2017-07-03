if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_kPFDpNSIaSR68rZPMMYPifuk',
    secret_key: 'sk_test_Kjghm7nm82eZHFEaxDyS6XZI'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]