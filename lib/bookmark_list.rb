class BookmarkList

  def self.all
    [ "http://www.makersacademy.com",
      "http://www.destroyallsoftware.com",
      "http://www.google.com" ]
  end

  def self.instance
    @bookmarks
  end

  def self.create
    @bookmarks = BookmarkList.new
  end

end
