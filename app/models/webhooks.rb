module Webhooks
	class PaymentIntentSucceeded
		def call(event)
			webhook_payment_intent = event.data.object
			#existing_payment_intent = Charge.find_by(stripe_payment_intent_id: webhook_payment_intent.id)
			#if existing_payment_intent.nil?
				new_payment_intent = Charge.new
				new_payment_intent.stripe_payment_intent_id = webhook_payment_intent.id
				new_payment_intent.amount = webhook_payment_intent.amount
				new_payment_intent.account_id = Account.find_by(stripe_id: webhook_payment_intent.transfer_data.destination).id
				new_payment_intent.application_fee_amount = webhook_payment_intent.application_fee_amount
				#new_payment_intent.transfer_data_amount = webhook_payment_intent.charges.data[:transfer_data][:amount]
				new_payment_intent.save
			#else
			#end
		end
	end
end