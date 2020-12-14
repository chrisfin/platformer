module Webhooks
	class ChargeSucceeded
		def call(event)
			webhook_charge = event.data.object

			new_charge = Charge.new

			new_charge.stripe_payment_intent_id = webhook_charge.id
			new_charge.amount = webhook_charge.amount
			new_charge.account_id = Account.find_by(stripe_id: webhook_charge.transfer_data.destination).id

			# Determine if Connect platform impelmented transfer data or application fee
			if (defined? webhook_charge.application_fee_amount)
				new_charge.application_fee_amount = webhook_charge.application_fee_amount
			end
			
			if (defined? webhook_charge.transfer_data.amount)
				new_charge.transfer_data_amount = webhook_charge.transfer_data.amount
			end

			new_charge.save
		end
	end
end