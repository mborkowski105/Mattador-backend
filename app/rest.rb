require 'oauth'
require 'json'
require 'byebug'

CONSUMER_KEY = 'VKxuVzTfght5w6O5S6AWUpTMb'
CONSUMER_SECRET = 'qCDq9iM1iuDSQAEkV9HVJKSR6r3ShQJK1nAtybOtcwkSoaGMDq'

OA_TOKEN = '1205933898133364737-ztmx81WMa4mb1KxPmy9zCT3EkG7wYb'
OA_SECRET = 'LqI7Ek4rpfImiLvRMAhVNX2PadhBAjCq3sujxU6GlJ8H2'

BASE_URI = 'https://api.twitter.com/1.1/'

consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { site: 'https://api.twitter.com', scheme: :header})
token_hash = { oauth_token: OA_TOKEN, oauth_token_secret: OA_SECRET }
access_token = OAuth::AccessToken.from_hash(consumer, token_hash)

tweets = JSON.parse(access_token.request(:get, "#{BASE_URI}statuses/home_timeline.json").body)

tweets.each do |tweet|
    Tweet.create_or_find_by(
        twitter_created_at: tweet.created_at,
        twitter_id: tweet.id,
        twitter_id_str: tweet.id_str,
        text: tweet.text,
        entities: tweet.entities
    )
end