require 'sinatra/base'
require './lib/bookmark'
require 'pg'

# here is a comment for rubocop
class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  before do
    @bookmarks = Bookmark.instance
  end

  get '/' do
    @bookmarks = Bookmark.instance
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/all'
  end

  get '/new' do
    erb :'bookmarks/new'
  end

  post '/add-bookmark' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  patch '/bookmarks/:id' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("UPDATE bookmarks SET url = '#{params[:url]}', title = '#{params[:title]}' WHERE id = '#{params[:id]}'")
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'
  end

  run! if app_file == $0

end
