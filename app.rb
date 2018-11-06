require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'
require './lib/posting'
require_relative 'enviroment_set_up'
require_relative 'bnb_helpers'

class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  helpers BnBHelpers

  before do
    current_user
  end

  get '/' do
    erb :index
  end

  post '/sign_up' do
    valid_user = User.create(name: params[:name], email: params[:email], password: params[:password])
    if valid_user
      session[:id] = valid_user.first['id']
      session[:email] = valid_user.first['email']
      redirect "/#{session[:id]}/home"
    else
      flash.next[:warning] = 'Email already registered to an account'
      redirect '/'
    end
  end

  get '/:id/home' do
    erb :user_home
  end

  get '/log_in' do
    erb :log_in
  end

  post '/session/new' do
    if (user = User.authenticate(params[:email], params[:password]))
      session[:id], session[:email] = user.id, user.email
      redirect "/#{session[:id]}/home"
    else
      flash.next[:warning] = 'Email or password is incorrect.'
      redirect '/log_in'
    end
  end

  post '/session/destroy' do
    session.clear
    flash.next[:message] = 'You have signed out.'
    redirect '/'
  end

  get '/postings/new' do
    erb :"postings/new"
  end

  post '/postings/save_new' do
    Posting.create(params[:post], '1')
    redirect "/postings"
  end

  get '/postings' do
    @postings = Posting.all
    erb :"postings"
  end

end
