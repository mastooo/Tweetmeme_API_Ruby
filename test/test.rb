$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "..", "lib"))

load 'tweetmeme.rb'

t = TweetMeme.new()
t.media = Media::Image
puts t.getMemes().inspect