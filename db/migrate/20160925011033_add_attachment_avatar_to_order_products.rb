class AddAttachmentAvatarToOrderProducts < ActiveRecord::Migration
  def self.up
    change_table :order_products do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :order_products, :avatar
  end
end
