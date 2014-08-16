# encoding: utf-8

require 'bundler'
Bundler.require
require 'sinatra/reloader' if development?



before do
  @site_title = 'Awesome benri site'
end



# Pages

get '/' do
  @page_title = 'Index'
  slim :index
end



# Assets

get '/assets/application.css' do
  scss :'../assets/css/application'
end

get '/assets/application.js' do
  coffee :'../assets/js/application'
end
