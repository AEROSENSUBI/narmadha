class OrderProduct < ApplicationRecord

  belongs_to        :order
	belongs_to        :vendor
  belongs_to        :product
  belongs_to        :send_order
	has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png",
                    :path => "/Sites/shared/images/:class/:attachment/:id_partition/:style/:filename",
                    :url => '/system/:class/:attachment/:id_partition/:style/:filename'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def customer_charges
  	product.customer_unit_price.to_f
  end

  def vendor_charges
    product.vendor_unit_price.to_f
  end
 
  def product_name
  	product.product_name
  end

  def total_customer_charge
    (customer_charges * units).to_f
  end

end
