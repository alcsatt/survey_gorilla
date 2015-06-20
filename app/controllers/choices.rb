get '/surveys/:id/questions/:question_id/choices/new' do
  @survey = Survey.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  erb :'/choices/new'
end