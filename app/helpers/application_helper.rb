module ApplicationHelper
	def main_page?
		if params[:controller]=='high_voltage/pages'
			"backstretch"
		end
	end
end
