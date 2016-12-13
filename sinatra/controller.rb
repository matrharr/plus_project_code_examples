require 'sinatra'

get '/' do
  "It's actually working!"
end

get '/hello' do
  "Hello World"
end

get '/about' do
  "<h1>A little about me.</h1>"
end

get '/greetings/:name' do
  @name = params[:name]
  erb :greeting
end