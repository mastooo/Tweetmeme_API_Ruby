$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "..", "lib"))

require "test/unit"
load 'tweetmeme.rb'

class TestTest < Test::Unit::TestCase

  def test_tweet_meme_default_instanciation
      t = TweetMeme.new()
      assert_equal t.media, Media::News
      assert_equal t.format, Format::Json
      assert_equal t.style, Style::Day
      assert_equal t.category, "technology"
  end
  
  def test_tweet_meme_change_format
      t = TweetMeme.new()
      t.format = Format::Xml
      assert_equal t.format, Format::Xml
      t.format = "xml"
      assert_equal t.format, Format::Xml
      t.format = Format::Json
      assert_equal t.format, Format::Json
      t.format = "json"
      assert_equal t.format, Format::Json
      
      begin
        t.format = "bad_format"
        asssert false
      rescue
        assert true
      end
  end
  
  
  def test_tweet_meme_change_media
      t = TweetMeme.new()
      t.media = Media::Image
      assert_equal t.media, Media::Image
      t.media = "image"
      assert_equal t.media, Media::Image
      t.media = Media::Video
      assert_equal t.media, Media::Video
      t.media = "video"
      assert_equal t.media, Media::Video
      t.media = Media::News
      assert_equal t.media, Media::News
      t.media = "news"
      assert_equal t.media, Media::News
      
      begin
        t.media = "bad_media"
        asssert false
      rescue
        assert true
      end
  end
  
  
  def test_tweet_meme_change_style
      t = TweetMeme.new()
      t.style = Style::Week
      assert_equal t.style, Style::Week
      t.style = "week"
      assert_equal t.style, Style::Week
      t.style = Style::Day
      assert_equal t.style, Style::Day
      t.style = "day"
      assert_equal t.style, Style::Day
      
      begin
        t.style = "bad_style"
        asssert false
      rescue
        assert true
      end
  end

end

# t = TweetMeme.new() 
# t.media = Media::Image
# puts t.getMemes().inspect