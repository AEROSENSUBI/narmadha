class CreateOrders < ActiveRecord::Migration[5.0]
  def self.up
    create_table :orders do |t|
      t.integer 	:number
      t.integer 	:customer_id
      t.integer 	:vendor_id
      t.datetime 	:booking_at
      t.datetime 	:ready_for_production_at
      t.datetime 	:dispatch_at
      t.datetime 	:delivery_at

      t.timestamps
    end
  end

  def self.down
  	drop_table :orders
  end
end
