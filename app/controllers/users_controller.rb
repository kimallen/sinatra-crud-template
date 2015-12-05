before '/users/*' do
	redirect '/users' unless current_user && authorized?
end

##INDEX
get '/users' do
	# @users = User.all
	erb :'users/index'

end

##NEW FORM
get '/users/new' do

	erb :'users/new'
end

##CREATE
post '/users' do
	@user = User.new(params[:user])
	if @user.save
		session[:id] = @user.id
		redirect "/users/#{@user.id}"
	else
		flash[:sign_up_error] = "Error signing in. Try again."
		redirect '/users/new'
	end

end

##SHOW
get '/users/:id' do
	
	# redirect '/users' unless current_user && current_user.id == params[:id].to_i
	@user = User.find(params[:id])
	erb :'/users/show'
end

##EDIT FORM
get '/users/:id/edit' do
	redirect '/users' unless current_user.id == params[:id].to_i
	@user = User.find(params[:id])
	erb :'/users/edit'
end

##UPDATE
put '/users/:id' do
	@user = User.find(params[:id])
	erb :'/users/show'
end

delete '/users/:id' do
	@user = User.find(parmas[:id])
	@user.destroy
	session.clear

end
