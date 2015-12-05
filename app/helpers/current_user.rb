helpers do
	def current_user
		@current_user ||= User.find(session[:id]) if session[:id]
	end

	def authorized?
		current_user.id == session[:id]
	end



end