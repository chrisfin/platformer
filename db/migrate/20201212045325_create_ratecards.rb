class CreateRatecards < ActiveRecord::Migration[6.0]
  def change
    create_table :ratecards do |t|
      t.string :plan
      t.string :name
      t.float :blended_fixed
      t.float :blended_variable

      t.timestamps
    end
  end
end
