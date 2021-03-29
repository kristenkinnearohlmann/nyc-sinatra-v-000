class FiguresController < ApplicationController
  # add controller methods

  post '/figures' do
    # Worked with Matthew and looked at student and main solutions and finally determined the issue
    # For the test with landmarks, title isn't passed and landmark is
    # Since I was trying to create my code to individual work with titles and landmarks, rather than
    # creating via the params hash, it failed. I hadn't had success, nor any tests failed me, on
    # creating with the hash, so I was doing it the longer way. But doing so meant that the associations
    # were not being made as expected. LESSON LEARNED!!
    figure = Figure.create(params[:figure])
binding.pry
#     # create title objects from selected titles
#     titles = params[:figure][:title_ids]
#     titles.map! {|title| Title.find(title)}
#     figure.titles << titles
# binding.pry
#     # create landmark objects from selected landmarks
#     landmarks = params[:figure][:landmark_ids]
#     landmarks.map! {|landmark| Landmark.find(landmarks)}
#     figure.landmarks << landmarks
#
#     figure.save

    redirect "/figures/#{figure.id}"
  end

  get '/figures/new' do

    erb :'figures/new'
  end

  get '/figures/:id' do
      @figure = Figure.find(params[:id])

      erb :'figures/show'
  end

end
