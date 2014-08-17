# encoding: utf-8

require 'bundler'
Bundler.require
require 'sinatra/reloader' if development?



before do
  @site_title = 'Awesome benri site'
end



# Page samples

get '/' do
  @page_title = 'Index'
  slim :index
end

get '/hello/:name' do
  "Hello #{params[:name]}!"
end

get '/hello/:name/:age' do |name, age|
  "You are #{name}, age is #{age}."
end

get '/hello/*/*' do |name, age|
  "You are #{name}, age is #{age}."
end

get '/posts.?:format?' do
  # It matches "/posts", "/posts.json" and "/posts.xml" and other extensions.
end

post '/hi' do
  "#{params[:post_field]}"
end


# Additonal page samples

## JSONP
get '/hello' do
  # data = ["hello","hi","hallo"]
  # jsonp data
end



# Assets

get '/assets/application.css' do
  scss :'../assets/css/application'
end

get '/assets/application.js' do
  coffee :'../assets/js/application'
end
