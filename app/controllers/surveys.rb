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
get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  if @survey.creator_id == session[:user_id]
    erb :'surveys/_show_survey'
  else
    erb :'/surveys/show'
  end
end

# Create
post '/surveys' do
  @survey = Survey.new(params[:survey])
  @survey.creator = current_user
  if @survey.save
    redirect "/surveys"
  else
    erb :'/surveys/new'
  end
end

# Edit
get '/surveys/:id/edit' do
  @survey = Survey.find_by(id: params[:id])
  if @survey.creator.id == session[:user_id]
    erb :'surveys/edit'
  else
    redirect "/surveys/#{cur_survey.id}"
  end
end

# Update
patch '/surveys/:id' do

end

# Destroy
delete '/surveys/:id' do

end