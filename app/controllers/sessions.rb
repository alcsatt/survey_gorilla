get '/signup' do
  erb :'sessions/signup'
end

post '/signup' do
  user = User.new(params[:user])
  return [500, "Invalid Signup"] unless user.save
  redirect '/login'
end

get '/login' do
  erb :'sessions/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  return [500, "Invalid User"] unless user
  if user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    erb :'sessions/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
