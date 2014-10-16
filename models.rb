# encoding: utf-8
require 'bundler'
Bundler.require

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/db/development.db")
DataMapper::Property::String.length 1024


class Log
  include DataMapper::Resource
  property :id         , Serial
  property :page       , String   , required: true, index: true
  property :referrer   , String   , required: true, index: true
  property :user_agent , String   , required: true, index: true
  property :ip_address , String   , required: true, length: 15
  property :created_at , DateTime , required: true
end

