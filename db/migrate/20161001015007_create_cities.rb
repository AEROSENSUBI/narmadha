class CreateCities < ActiveRecord::Migration[5.0]
  def up
    create_table :cities do |t|
      t.string :area, :limit => 50
      t.string :city, :limit => 50
      t.string :taluk, :limit => 50
      t.string :district, :limit => 50
      t.string :state, :limit => 50
      t.string :pin_code, :limit => 8
      t.timestamps
    end
    add_column :customers, :area, :string, :limit =>50
  end

  def down
  	drop_table :cities
  	remove_column :customers, :area
  end
end
