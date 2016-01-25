# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  erb :'songs/index'
end

get '/songs/new'  do
  erb :'songs/new'  
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    url: params[:url],
    author:  params[:author]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end