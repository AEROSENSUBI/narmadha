class CreateContracts < ActiveRecord::Migration[5.0]
  def self.up
    create_table :contracts do |t|
    	t.string 		:name
    	t.datetime 	:start_date
    	t.datetime 	:end_date
    	t.integer		:vendor_id
    	t.float			:customer_unit_price
    	t.float			:vendor_unit_price

      t.timestamps
    end
  end

  def self.down
  	drop_table :contracts
  end
end
