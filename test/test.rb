$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "..", "lib"))

load 'tweetmeme.rb'

t = TweetMeme.new(format=Format::Json, category="technology", media=Media::News, style=Style::Day)
t.media = Media::Image
puts t.getMemes().inspect