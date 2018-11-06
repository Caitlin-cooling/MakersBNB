require 'sinatra/base'
require './lib/user'
require_relative 'enviroment_set_up'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/sign_up' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password]).first
    redirect "/#{user['id']}/home"
  end

  get '/:id/home' do
    @user = User.all.last
    erb :user_home
  end

  get '/postings/new' do
    erb :"postings/new"
  end

  post '/postings/save_new' do
    Posting.create(params[:post], '1')
    redirect "/postings"
  end

  get '/postings' do
    "Cool new place!"
  end

end
