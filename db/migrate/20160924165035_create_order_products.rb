class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def self.up
    create_table :order_products do |t|
      t.integer   :order_id
    	t.integer 	:vendor_id
    	t.integer 	:product_id
    	t.integer 	:units
    	t.datetime 	:expected_delivery_date
    	t.string 		:notes
    	
      t.timestamps
    end
  end

  def self.down
  	drop_table :order_products
  end
end
