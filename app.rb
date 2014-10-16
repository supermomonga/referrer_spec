# encoding: utf-8

require 'bundler'
Bundler.require
require 'pp'

module Rack
  class CommonLogger
    def call(env)
      # do nothing
      @app.call(env)
    end
  end
end

class App < Sinatra::Base

  def initialize *args
    require './models'
    DataMapper.finalize.auto_upgrade!
    super
  end

  before do
  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  get '/' do
    logger.info "GGG"
    puts "\n\n"
    puts "↓" * 60
    puts "↓" * 60
    puts "\n\n"
    slim :index
  end

  get '/inside_iframe' do
    @browser = {
      page: 'inside_iframe',
      user_agent: request.user_agent,
      referrer: request.referrer,
      ip_address: request.ip,
    }
    print_brower @browser
    slim :inside_iframe
  end

  get '/inside_iframe_nested' do
    @browser = {
      page: 'inside_iframe_nested',
      user_agent: request.user_agent,
      referrer: request.referrer,
      ip_address: request.ip,
    }
    print_brower @browser
    redirect to('/inside_iframe_nested_redirected')
  end

  get '/inside_iframe_nested_redirected' do
    @browser = {
      page: 'inside_iframe_nested_redirected',
      user_agent: request.user_agent,
      referrer: request.referrer,
      ip_address: request.ip,
    }
    print_brower @browser
    'Hello World'
    # slim :browser_information
  end

  get '/assets/application.css' do
    scss :'../assets/css/application'
  end

  get '/assets/application.js' do
    coffee :'../assets/js/application'
  end

  private
  def print_brower b
    puts
    puts "=" * 60
    puts b[:page].upcase
    puts "  => USER AGENT : #{b[:user_agent][0..40]}"
    puts "  => REFERRER   : #{b[:referrer]}"
    puts "  => IP ADDRESS : #{b[:ip_address]}"
  end

end
