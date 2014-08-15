# encoding: utf-8

require 'bundler'
Bundler.require

require 'sinatra/reloader' if development?


get '/' do
  content_type :text
  'Hello Heroku'
end
