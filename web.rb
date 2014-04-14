require 'sinatra'
require 'sinatra/base'

class MyApp < Sinatra::Base
  set :static, true
  set :public, File.dirname(__FILE__) + '/static'
end

get '/' do
  File.read(File.join('static', 'index.html'))
end
