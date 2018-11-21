require 'sinatra/base'
require './lib/bookmark_list'
require 'pg'

# here is a comment for rubocop
class BookmarkManager < Sinatra::Base

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
    Bookmark.create(url: params[:new_link])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
