class ChargePaymentIntentInCharges < ActiveRecord::Migration[6.0]
  def change
  	remove_column :charges, :stripe_payment_intent_id, :string
  	add_column :charges, :stripe_charge_id, :string
  end
end
