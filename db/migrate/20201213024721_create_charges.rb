class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.float :amount
      t.integer :account_id
      t.float :application_fee_amount
      t.float :transfer_data_amount

      t.timestamps
    end
  end
end
