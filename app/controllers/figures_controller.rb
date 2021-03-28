class FiguresController < ApplicationController
  # add controller methods

  post '/figures' do

    figure = Figure.create(name: params[:figure][:name])

    # create title objects from selected titles
    titles = params[:figure][:title_ids]
    titles.map! {|title| Title.find(title)}

    # create landmark objects from selected landmarks
    landmarks = params[:figure][:landmark_ids]
    landmarks.map! {|landmark| Landmark.find(landmarks)}

    figure.landmarks << landmarks
    figure.titles << titles
    figure.save

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
