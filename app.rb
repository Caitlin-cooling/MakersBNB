require 'sinatra/base'
require './lib/user'
require_relative 'enviroment_set_up'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/sign_up' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    redirect "/home"
  end

  get '/home' do
    @user = User.all.last
    erb :user_home
  end
end
