class CreateRoutes < ActiveRecord::Migration[5.0]
  def self.up
    create_table :routes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
