class City < ApplicationRecord

	def area_with_city
		"#{area}, #{city}"
	end
end
