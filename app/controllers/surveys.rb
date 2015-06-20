# Index
get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

# New
get '/surveys/new' do
  erb :'surveys/new'
end

# Show
get '/surveys/:title' do

end

# Create
post '/surveys' do
  @survey = Survey.new(params[:survey])
  if @survey.save
    redirect "/surveys"
  else

  end
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