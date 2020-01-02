# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

cnn = TwitterUser.create_or_find_by(twitter_id: 428333, twitter_id_str: "428333", name: "CNN Breaking News", screen_name:"cnnbrk", profile_image_url:"http://pbs.twimg.com/profile_images/925092227667304448/fAY1HUu3_normal.jpg",verified: true)
ap = TwitterUser.create_or_find_by(twitter_id: 51241574, twitter_id_str: "51241574", name: "The Associated Press", screen_name:"AP", profile_image_url:"http://pbs.twimg.com/profile_images/461964160838803457/8z9FImcv_normal.png",verified: true)
nytimes = TwitterUser.create_or_find_by(twitter_id: 807095, twitter_id_str: "807095", name: "The New York Times", screen_name:"nytimes", profile_image_url:"http://pbs.twimg.com/profile_images/1098244578472280064/gjkVMelR_normal.png",verified: true)
arstech = TwitterUser.create_or_find_by(twitter_id: 717313, twitter_id_str: "717313", name: "Ars Technica", screen_name:"arstechnica", profile_image_url:"http://pbs.twimg.com/profile_images/2215576731/ars-logo_normal.png",verified: true)
wsj = TwitterUser.create_or_find_by(twitter_id: 3108351, twitter_id_str: "3108351", name: "The Wall Street Journal", screen_name:"WSJ", profile_image_url:"http://pbs.twimg.com/profile_images/971415515754266624/zCX0q9d5_normal.jpg",verified: true)
nyweather = TwitterUser.create_or_find_by(twitter_id: 43435902, twitter_id_str: "43435902", name: "NY1 Weather", screen_name:"NY1weather", profile_image_url:"http://pbs.twimg.com/profile_images/959067130/NY1_Twit_Weather_Icon_normal.jpg",verified: true)
npr = TwitterUser.create_or_find_by(twitter_id: 5392522, twitter_id_str: "5392522", name: "NPR", screen_name:"NPR", profile_image_url:"http://pbs.twimg.com/profile_images/1208165423109292032/_oEEIsvx_normal.jpg",verified: true)
natgeo = TwitterUser.create_or_find_by(twitter_id: 17471979, twitter_id_str: "17471979", name: "National Geographic", screen_name:"NatGeo", profile_image_url:"https://pbs.twimg.com/profile_images/1053339335217549312/3AsJxV1h_normal.jpg",verified: true)

tweets_result = tweets.each do |tweet|
    Tweet.create_or_find_by(
        twitter_created_at: tweet["created_at"],
        twitter_id: 0, #hard-coded, change later, activerecord couldn't handle huge integer size
        twitter_id_str: tweet["id_str"],
        twitter_user_id: TwitterUser.find_by(twitter_id: tweet["user"]["id"]).id,
        text: tweet["text"],
        entities: "",
        hashtags: "",
        media: "",
        media_url: ""
    )
end

byebug

puts "Hello"

# follow1 = Follow.create_or_find_by(user_id: user1.id, twitter_user_id: dad.id)