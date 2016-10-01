class AddSendOrderIdToOrderProducts < ActiveRecord::Migration[5.0]
  def up
  	add_column :order_products, :send_order_id, :integer
  	add_column :order_products, :status, :string
  end

  def down
  	remove_column :order_products, :send_order_id
  	remove_column :order_products, :status
  end
end
