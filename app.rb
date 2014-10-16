# encoding: utf-8

require 'bundler'
Bundler.require
require 'pp'

class App < Sinatra::Base

  def initialize *args
    require './models'
    DataMapper.finalize.auto_upgrade!
    super
  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  get '/' do
    slim :index
  end

  get '/inside_iframe' do
    @browser = {
      page: 'inside_iframe',
      user_agent: request.user_agent,
      referrer: request.referrer,
      ip_address: request.ip,
    }
    puts '-' * 20
    puts @browser[:page].upcase
    pp @browser
    redirect to('/inside_iframe_redirected')
  end

  get '/inside_iframe_redirected' do
    @browser = {
      page: 'inside_iframe_redirected',
      user_agent: request.user_agent,
      referrer: request.referrer,
      ip_address: request.ip,
    }
    puts '-' * 20
    puts @browser[:page].upcase
    pp @browser
    'Hello World'
    # slim :browser_information
  end

  get '/assets/application.css' do
    scss :'../assets/css/application'
  end

  get '/assets/application.js' do
    coffee :'../assets/js/application'
  end

end
