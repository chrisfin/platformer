class ChargesController < ApplicationController
	def new
		@intent = Stripe::PaymentIntent.create({
		  amount: 1099,
		  currency: 'usd',
		})
	end
end
