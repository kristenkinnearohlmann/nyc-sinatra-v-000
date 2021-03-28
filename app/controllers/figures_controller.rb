class FiguresController < ApplicationController
  # add controller methods

  post '/figures' do
    binding.pry
    figure = Figure.create(name: params[:figure][:name])
    titles = params[:figure][:title_ids]
    titles.map! {|title| Title.find(title)}

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
