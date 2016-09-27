class OrderProduct < ApplicationRecord

	belongs_to        :orders
	belongs_to        :products
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def customer_charges
  	products.customer_unit_price.to_i
  end

  def product_name
  	products.product_name
  end

end
