def logged_in?
  redirect '/login' unless authenticated?
end

def authenticated?
  !!session[:user_id]
end