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
  
  def test_json_story_parsing
    json_story = %!{"title":"Great way to wrap up leg one of the My World Tour. Proud of the kid. | Plixi",
      "url":"http:\/\/plixi.com\/p\/43533509",
      "media_type":"news",
      "created_at":"2010-09-06 01:46:03",
      "url_count":"1712",
      "tm_link":"http:\/\/tweetmeme.com\/story\/2255899108",
      "comment_count":"1",
      "excerpt":"Great way to wrap up leg one of the My World Tour. Proud of the kid. http:\/\/plixi.com\/p\/43533509"}
    !
    t = TweetMeme.new
    meme = t.parse_xml_story JSON.parse(json_story) 
    verify(meme, t.media)
  end
  
  def test_xml_story_parsing
    xml_story = %!<stories><story><title>Great way to wrap up leg one of the My World Tour. Proud of the kid. | Plixi</title>
    <url>http://plixi.com/p/43533509</url>
    <media_type>news</media_type>
    <created_at>2010-09-06 01:46:03</created_at>
    <url_count>1731</url_count>
    <tm_link>http://tweetmeme.com/story/2255899108</tm_link>
    <comment_count>1</comment_count>
    <excerpt>Great way to wrap up leg one of the My World Tour. Proud of the kid. http://plixi.com/p/43533509</excerpt>
    </story></stories>
    !
    
    t = TweetMeme.new
    doc = REXML::Document.new(xml_story);
    
    doc.elements.each("/story") do |story|
      meme = t.parse_xml_story(story)
      puts meme.title
      verify(meme, t.media)
    end
  end
  
  def verify (meme, media)
    assert_equal meme.title, "Great way to wrap up leg one of the My World Tour. Proud of the kid. | Plixi"
    assert_equal meme.url, "http://plixi.com/p/43533509"
    assert_equal meme.media_type, media
    assert_equal meme.created_at, "2010-09-06 01:46:03"
    assert_equal meme.excerpt, "Great way to wrap up leg one of the My World Tour. Proud of the kid. http://plixi.com/p/43533509"
  end
  
end

t = TweetMeme.new(format=Format::Json, category="technology", media=Media::News, style=Style::Day)
t.media = Media::Image