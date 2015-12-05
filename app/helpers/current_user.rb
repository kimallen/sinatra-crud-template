helpers do
	def current_user
		@current_user ||= User.find_by_id(session[:id]) if session[:id]
	end

	def authorized?
		current_user.id == params[:id].to_i
	end



end