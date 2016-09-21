class CreateCustomers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :shop_name, :limit => 100
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :city, :limit => 50
      t.string :taluk, :limit => 50
      t.string :district, :limit => 50
      t.string :state, :limit => 50
      t.string :pin_code, :limit => 8
      t.string :contact_number_1, :limit => 20
      t.string :contact_number_2, :limit => 20
      t.string :email
      t.string :website

      t.timestamps
    end
  end
  
  def self.down
    drop_table :customers
  end
end
