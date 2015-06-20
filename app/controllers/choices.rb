get '/surveys/:id/questions/:question_id/choices/new' do
  @survey = Survey.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  erb :'/choices/new'
end

post '/surveys/:id/questions/:question_id/choices' do
  choice = Choice.new(params[:choice])
  return [500, 'Invalid Choice'] unless choice.save
  question = Question.find_by(id: params[:question_id])
  survey = Survey.find_by(id: params[:id])
  question.choices << choice
  redirect "/surveys/#{survey.id}"
end

get '/surveys/:id/questions/:question_id/choices/:choice_id' do
  @choice = Choice.find_by(id: params[:choice_id])
  @survey = Survey.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  erb :'/choices/show'
end