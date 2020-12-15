class AddRatecardIDtoAccounts < ActiveRecord::Migration[6.0]
  def change
  	add_column :accounts, :ratecard_id, :integer
  end
end
