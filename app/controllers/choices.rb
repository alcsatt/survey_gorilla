get '/surveys/:id/questions/:question_id/choices/new' do
  @survey = Survey.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  erb :'/choices/new', layout: false
end

post '/surveys/:id/questions/:question_id/choices' do
  choice = Choice.new(params[:choice])
  return [500, 'Invalid Choice'] unless choice.save
  question = Question.find_by(id: params[:question_id])
  survey = Survey.find_by(id: params[:id])
  question.choices << choice
  if request.xhr?
    return choice.to_json
  else
    redirect "/surveys/#{survey.id}"
  end
end

get '/surveys/:id/questions/:question_id/choices/:choice_id' do
  @choice = Choice.find_by(id: params[:choice_id])
  @survey = Survey.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  erb :'/choices/show'
end

get '/surveys/:id/questions/:question_id/choices/:choice_id/edit' do
  @choice = Choice.find_by(id: params[:choice_id])
  @survey = Survey.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  erb :'/choices/edit'
end

patch '/surveys/:id/questions/:question_id/choices/:choice_id' do
  choice = Choice.find_by(id: params[:choice_id])
  survey = Survey.find_by(id: params[:id])
  question = Question.find_by(id: params[:question_id])
  choice.update(params[:choice])
  redirect "/surveys/#{survey.id}/questions/#{question.id}/choices/#{choice.id}"
end

delete '/surveys/:id/questions/:question_id/choices/:choice_id' do
  Choice.find_by(id: params[:choice_id]).destroy
  survey = Survey.find_by(id: params[:id])
  question = Question.find_by(id: params[:question_id])
  redirect "/surveys/#{survey.id}/questions/#{question.id}"
end