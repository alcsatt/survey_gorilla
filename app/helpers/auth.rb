def logged_in?
  redirect '/login' unless authenticated?
end

def authenticated?
  !!session[:user_id]
end

def current_user
  User.find_by(id: session[:user_id])
end