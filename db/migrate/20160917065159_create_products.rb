class CreateProducts < ActiveRecord::Migration[5.0]
  def self.up
    create_table :products do |t|
    	t.string 	:product_name
    	t.string	:product_type
    	t.string	:product_size
    	t.string	:product_colour
      t.float   :customer_unit_price
      t.float   :vendor_unit_price

      t.timestamps
    end
  end

  def self.down
  	drop_table :products
  end
end
