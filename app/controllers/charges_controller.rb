class ChargesController < ApplicationController
	def new
		@intent = Stripe::PaymentIntent.create({
		  amount: 1098,
		  currency: 'usd',
		  application_fee_amount: 123,
		  transfer_data: {
    		destination: 'acct_1HxPPERkD82YN8yU',
  		},
		})

	end

	def index

	end
end
