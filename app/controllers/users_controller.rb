

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
	redirect '/users' unless current_user && authorized? 
	@user = User.find(params[:id])
	erb :'/users/show'
end

##EDIT FORM
get '/users/:id/edit' do
	redirect '/users' unless current_user && authorized?
	@user = User.find(params[:id])
	erb :'/users/edit'
end

##UPDATE
put '/users/:id' do
	@user = User.find(params[:id])
p '************'
	p @user
	p params
p '************'
	@user.update(params[:user])
	erb :'/users/show'
end

delete '/users/:id' do
	@user = User.find(params[:id])
	@user.destroy
	session.clear
	current_user = nil
	redirect '/'

end
