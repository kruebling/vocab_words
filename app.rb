require ('rubygems')
require ('bundler/setup')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('pry')

get('/') do
  @list = Word.all()
  erb(:input)
end

post('/') do
  vocab = params["vocab"]
  definition = params["definition"]

  word = Word.new(vocab, definition)

  word.save()
  @list = Word.sort
  erb(:input)
end

get('/words/:id') do
  @word = Word.find(params[:id])
  erb(:output)
end

post('/words/:id') do
  @word = Word.find(params[:id])
  Word.delete(@word.id)
  @list = Word.sort
  redirect '/'
  erb(:output)
end
