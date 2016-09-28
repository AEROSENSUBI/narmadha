class Vendor < ApplicationRecord

	 has_many								:order_products
	 validates						  :contact_number_1, uniqueness: true

	def address_line
		address = ''
		address += address_line_1 if address_line_1.present?
		address += ', ' + address_line_2 if address_line_2.present?
		address += ', ' + address_line_3 if address_line_3.present?
		return address
	end

	def city_and_district
		city + ', ' + taluk + ', ' + district + ' - ' + pin_code
	end

	def full_address
		address_line + ', ' + city + ', ' + taluk + ', ' + district + ', ' + state + ' - ' + pin_code
	end

	def mobile_number
		mobile_number = ''
		mobile_number += contact_number_1 if contact_number_1.present?
		mobile_number += ' | ' + contact_number_2 if contact_number_2.present?
		return mobile_number
	end
	
end
