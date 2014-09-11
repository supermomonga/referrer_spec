# encoding: utf-8

require 'bundler'
Bundler.require(:tasks)

Dotenv.load

$:.unshift File.dirname(__FILE__)

desc 'Migrate database'
task :migrate do
  require './models'
  puts "Migrating start."
  DataMapper.finalize.auto_migrate!
  puts "Migrating finished."
end



