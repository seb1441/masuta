# Stripe.api_key = 'sk_test_51HFU15CdGYStXYkyLgwwVsJDqNRldvWFIgOQA9OppYn2XDqUAvfi1fH7r5olITsntglGkGfnKVS73vgYC3WjZnQs00bLlF7kWT'
# Stripe.api_key = Rails.application.credentials.stripe_publishable_key
Stripe.api_key = Rails.application.credentials.stripe[:secret_key]