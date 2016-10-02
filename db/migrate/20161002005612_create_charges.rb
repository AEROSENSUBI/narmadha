class CreateCharges < ActiveRecord::Migration[5.0]
  def up
    create_table :charges do |t|
      t.integer :customer_id
      t.float 	:product_charge
      t.float 	:courier_charge
      t.float 	:designing_charge
      t.float 	:additional_charge
      t.float 	:advance_payed
      t.float 	:total_charges
      t.float 	:payed_amount
      t.float 	:payed_type
      t.float 	:remaining_amount
      t.float 	:balance_amount
      t.timestamps
    end
    add_column :orders, :product_charge, :float
    add_column :orders, :courier_charge, :float
    add_column :orders, :designing_charge, :float
    add_column :orders, :additional_charge, :float
    add_column :orders, :advance_payed, :float
    add_column :orders, :total_charges, :float
  end

  def down
  	drop_table :charges
  	remove_column :orders, :product_charge
  	remove_column :orders, :courier_charge
  	remove_column :orders, :designing_charge
  	remove_column :orders, :additional_charge
  	remove_column :orders, :advance_payed
  	remove_column :orders, :total_charges
  end
end
