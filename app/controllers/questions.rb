get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  erb :'questions/new'
end

post '/surveys/:id/questions' do
  survey = Survey.find_by(id: params[:id])
  question = Question.new(params[:question])
  return [500, "Invalid Question"] unless question.save
  survey << question
  redirect "/surveys/#{survey.id}"
end

get '/surveys/:id/questions/:question_id' do
  survey = Survey.find_by(id: params[:id])
  question = Question.find_by(id: params[:question_id])
  choices = question.choices
  erb :'/questions/show', locals: {survey: survey, question: question, choices: choices}
end

get '/surveys/:id/questions/:question_id/edit' do
  survey = Survey.find_by(id: params[:id])
  question = Question.find_by(id: params[:question_id])
  erb :'/questions/edit', locals: {survey: survey, question: question}
end

put '/surveys/:id/questions/:question_id' do

end

delete '/surveys/:id/questions/:question_id' do

end