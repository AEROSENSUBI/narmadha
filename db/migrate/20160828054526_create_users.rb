class CreateUsers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :salt
      t.string :password_digest
      t.string :email
      t.string :mobile_number

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :mobile_number, unique: true
  end
  
  def self.down
    drop_table :users
  end
end
