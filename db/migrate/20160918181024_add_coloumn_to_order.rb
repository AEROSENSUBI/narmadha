class AddColoumnToOrder < ActiveRecord::Migration[5.0]
  def self.up
  	add_column :orders, :product_id, :string
  	add_column :orders, :units, :string
    add_column :orders, :expected_delivery_date, :datetime
  	add_column :orders, :notes, :string
  end

  def self.down
  	remove_column :orders, :product_id
  	remove_column :orders, :units
  	remove_column :orders, :expected_delivery_date
    remove_column :orders, :notes
  end
end
