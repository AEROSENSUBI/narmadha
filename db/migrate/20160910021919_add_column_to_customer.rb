class AddColumnToCustomer < ActiveRecord::Migration[5.0]
  def self.up
  	add_column :customers, :is_tailors, :string
  	add_column :customers, :is_upstair, :string
    add_column :customers, :is_opposite_or_near, :string
  	add_column :customers, :is_back_side_of, :string
  end

  def self.down
  	remove_column :customers, :is_tailors
  	remove_column :customers, :is_upstair
  	remove_column :customers, :is_opposite_or_near
    remove_column :customers, :is_back_side_of
  end
end
