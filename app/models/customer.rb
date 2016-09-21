class Customer < ApplicationRecord
	 before_save 						:update_address_line
	 has_many								:orders
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

	def shop_name_with_city
		"#{self.shop_name}, #{self.city}"
	end

	private

		def update_address_line	
			self.address_line_1.slice! "Tailors" if self.is_tailors_changed? && self.shop_name.include?("Tailors")
			self.address_line_1.slice! "Upstair : " if self.is_upstair_changed? && self.address_line_1.include?("Upstair : ")
			self.address_line_2.slice! "Opposite : " if self.is_opposite_or_near_changed? && self.address_line_2.include?("Opposite : ")
			self.address_line_2.slice! "Near : " if self.is_opposite_or_near_changed? && self.address_line_2.include?("Near : ")
			self.address_line_3.slice! "Back Side" if self.is_back_side_of_changed? && self.address_line_3.include?("Back Side")

			self.shop_name = "#{self.shop_name} #{self.is_tailors}" if self.is_tailors_changed?
			self.address_line_1 = "#{self.is_upstair} #{self.address_line_1}" if self.is_upstair_changed?
			self.address_line_2 = "#{self.is_opposite_or_near} #{self.address_line_2}" if self.is_opposite_or_near_changed?
			self.address_line_3 = "#{self.address_line_3} #{self.is_back_side_of}" if self.is_back_side_of_changed?
		end
end
