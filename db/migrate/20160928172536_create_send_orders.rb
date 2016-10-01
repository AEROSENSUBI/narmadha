class CreateSendOrders < ActiveRecord::Migration[5.0]
  def self.up
    create_table :send_orders do |t|
    	t.integer 	:user_id
    	t.integer		:vendor_id
    	t.integer		:charge_id
    	t.string		:notes
    	t.date			:send_date

      t.timestamps
    end
  end

  def self.down
  	drop_table :send_orders
  end
end
