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
    erb :'surveys/edit', layout: !request.xhr?
  else
    redirect "/surveys/#{@survey.id}"
  end
end

# Update
patch '/surveys/:id' do
  survey = Survey.find_by(id: params[:id])
  survey.update(params[:survey])
  if request.xhr?
    return survey.to_json
  else
    redirect "/surveys/#{survey.id}"
  end
end

# Destroy
delete '/surveys/:id' do
  survey = Survey.find_by(id: params[:id])
  survey.destroy
  if request.xhr?
    return survey.to_json
  else
    redirect "/surveys/#{survey.id}"
  end
end

post '/surveys/:id/submit' do
  survey = Survey.find_by(id: params[:id])
  current_user.surveys << survey
  choices = []
  params[:choice].each do |k, v|
    choices << Choice.where(answer: v, question_id: k)
  end
  choices.flatten.each{|choice| current_user.choices << choice}
  redirect "/surveys/#{survey.id}/results"
end

get '/surveys/:id/results' do
  @survey = Survey.find_by(id: params[:id])
  erb :'/surveys/results'
end