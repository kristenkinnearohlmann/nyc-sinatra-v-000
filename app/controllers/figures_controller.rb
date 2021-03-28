class FiguresController < ApplicationController
  # add controller methods

  post '/figures' do
    raise params.inspect
    redirect "/figures/#{figure.id}"
    erb
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  get '/figures/:id' do

      erb :'figures/show'
  end

end
