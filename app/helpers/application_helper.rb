module ApplicationHelper
	def main_page?
		if params[:controller] == 'pages' && params[:action] == 'index'
			"backstretch"
		end
	end
end
