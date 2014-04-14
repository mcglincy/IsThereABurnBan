require 'sinatra'
require 'sinatra/base'

class MyApp < Sinatra::Base
  set :static, true
  set :public, File.dirname(__FILE__) + '/public'
end

get '/' do
  File.read(File.join('public', 'index.html'))
end
