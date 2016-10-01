require 'rubygems'
require 'zip'
class MailMailer < ApplicationMailer
	default from: 'NARMADHA ENTERPRISES <aerosenthilprabhu@gmail.com>'

	def order_send(current_user)
		attachments['NARMADHA ENTERPRISES_2016-09-30.pdf'] = MailMailer.zip_report("NARMADHA ENTERPRISES_2016-09-30", File.read("/Sites/shared/images/order_products/avatars/000/000/008/original/NARMADHA ENTERPRISES_2016-09-30.pdf"))
		mail(to: "narmadhalabels@gmail.com", subject: "Order Send Details")
	end

	def self.zip_report(file_name, record_array)
    temp_file = Tempfile.new(file_name + ".zip")
    Zip::File.open(temp_file.path, Zip::File::CREATE).add('NARMADHA ENTERPRISES_2016-09-30.pdf', "/Sites/shared/images/order_products/avatars/000/000/008/original/NARMADHA ENTERPRISES_2016-09-30.pdf")
    temp_file
  end
end
