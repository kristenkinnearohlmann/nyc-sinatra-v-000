class FiguresController < ApplicationController
  # add controller methods

  post '/figures' do
    

    redirect "/figures/#{figure.id}"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  get '/figures/:id' do
      @figure = Figure.find(params[:id])

      erb :'figures/show'
  end

end
