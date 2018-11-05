require 'sinatra/base'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end
end
