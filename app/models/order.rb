class Order < ApplicationRecord

	belongs_to 			:customer
	belongs_to 			:vendor
	has_many   			:order_products, 	:dependent  => :destroy
	accepts_nested_attributes_for 	:order_products, :allow_destroy => true

	def number
		number || id
	end
	
	def customer_name
		customer.shop_name if customer.present?
	end

	def vendor_name
		vendor.company_name
	end

	def status
		"Created"
	end

	def total_units
		order_products.map(&:units).map(&:to_i).sum
	end

	def total_charges
		order_products.map(&:customer_charges).sum
	end
end
