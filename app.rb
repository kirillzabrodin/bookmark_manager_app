require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require './database_connection_setup'
require 'pg'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  before do
    @bookmarks = Bookmark.instance
  end

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/all'
  end

  get '/new' do
    erb :'bookmarks/new'
  end

  post '/add-bookmark' do
    link = Bookmark.create(url: params['url'], title: params[:title])
    flash[:notice] = "You must submit a valid URL." unless link

    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  run! if app_file == $0

end
