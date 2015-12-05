get '/login' do
	erb :'/sessions/new'
end


post '/login' do

	@user = User.find_by(email: params[:email])
	
	if @user && @user.password == params[:password]
		session[:id] = @user.id
		redirect "/users/#{@user.id}"
	else
		flash[:login_error] = "Incorrect email or password"
		redirect '/login'
	end
end

get '/logout' do
	session[:id] = nil
	current_user = nil
	redirect '/'
end