class BookmarkList

  def self.all
    begin
      connection = PG.connect :dbname => 'bookmark_manager'
      result = connection.exec "SELECT * FROM bookmarks;"
      result.map { |bookmark| bookmark['url'] }
    end
  end

  def self.all_test
    begin
      connection = PG.connect :dbname => 'bookmark_manager_test'
      result = connection.exec "SELECT * FROM bookmarks;"
      result.map { |bookmark| bookmark['url'] }
    end
  end

  def self.instance
    @bookmarks
  end

  def self.create
    @bookmarks = BookmarkList.new
  end

end
