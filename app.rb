require 'sinatra/base'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/sign_up' do
    session[:name] = params[:name]
    redirect "/home"
  end

  get '/home' do
    @name = session[:name]
    erb :user_home
  end
end
