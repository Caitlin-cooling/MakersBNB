require 'sinatra/base'
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
    @name = session[:name]
    erb :user_home
  end
end
