class Order < ApplicationRecord

	belongs_to 		:customer
	belongs_to 		:vendor
	has_attached_file 								:avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def number
		number || id
	end
	
	def customer_name
		customer.shop_name
	end

	def vendor_name
		vendor.company_name
	end

	def status
		"Created"
	end
end
