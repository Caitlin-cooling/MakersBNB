require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'
require_relative 'enviroment_set_up'

class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/sign_up' do
    valid_user = User.create(name: params[:name], email: params[:email], password: params[:password])
    if valid_user
      redirect "/#{valid_user.first['id']}/home"
    else
      flash.next[:warning] = 'Email already registered to an account'
      redirect '/'
    end
  end

  get '/:id/home' do
    @user = User.all.last
    erb :user_home
  end

  get '/postings/new' do
    erb :"postings/new"
  end
end
