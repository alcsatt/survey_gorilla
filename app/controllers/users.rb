get '/users/:id' do
  logged_in?
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])
  return [500, "User does not exist"] unless @user
  erb :'/users/edit'
end

put '/users/:id' do
  @user = User.find_by(id: params[:id])
  @user.update(params[:user])
  redirect "/users/#{@user.id}"
end