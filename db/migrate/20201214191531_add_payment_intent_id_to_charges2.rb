class AddPaymentIntentIdToCharges2 < ActiveRecord::Migration[6.0]
  def change
  	add_column :charges, :stripe_payment_intent_id, :string
  end
end
