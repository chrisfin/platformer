class ChargesController < ApplicationController
	def new
		@intent = Stripe::PaymentIntent.create({
		  amount: 5098,
		  currency: 'usd',
		  application_fee_amount: 123,
		  on_behalf_of: 'acct_1HxPPERkD82YN8yU',
		  transfer_data: {
    		destination: 'acct_1HxPPERkD82YN8yU',
  		},
		})

	end
end
