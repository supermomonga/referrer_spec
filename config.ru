require 'bundler'
Bundler.require

if defined? Unicorn::HttpRequest
  use GC::OOB::UnicornMiddleware
end

require './app'
run App

