require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/definition')
also_reload('lib/**/*.rb')

get ('/') do
  @words = Word.all
  erb(:words)
end

get ('/words') do
  @words = Word.all
  erb(:words)
end

get ('/words/new') do
  erb(:new_word)
end

post ('/words') do
  name = params[:word_name]
  definition = params[:word_definition]
  word = Word.new(name, definition, nil)
  word.save()
  @words = Word.all()
  erb(:words)
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

post ('/words_search') do
  name = params[:search]
  @words = Word.search(name)
  erb(:word_results)
end

get ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name, :definition])
  @words = Word.all
  erb(:words)
end

delete ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end
