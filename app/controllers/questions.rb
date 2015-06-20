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

get '/surveys/:id/questions/:question_id/edit' do

end

put '/surveys/:id/questions/:question_id' do

end

delete '/surveys/:id/questions/:question_id' do

end