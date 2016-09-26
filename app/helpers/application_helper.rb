module ApplicationHelper

	def current_user
		User.find_by_id(session[:user_id])
	end

	def active_class(link_path)
  	current_page?(link_path) ? "active" : ""
 	end
end
