require 'bookmark_list'

describe BookmarkList do

  subject(:test_bookmarks) { described_class.new("bookmark_manager_test") }

  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = BookmarkList.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
