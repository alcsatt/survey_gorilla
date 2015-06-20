# Index
get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

# New
get '/surveys/new' do

end

# Show
get '/surveys/:title' do

end

# Create
post '/surveys' do

end

# Edit
get '/surveys/:id/edit' do

end

# Update
patch '/surveys/:id' do

end

# Destroy
delete '/surveys/:id' do

end