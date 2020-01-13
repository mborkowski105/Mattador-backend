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
require "google/cloud/language"

# twitter stuff below

CONSUMER_KEY = 'VKxuVzTfght5w6O5S6AWUpTMb'
CONSUMER_SECRET = 'qCDq9iM1iuDSQAEkV9HVJKSR6r3ShQJK1nAtybOtcwkSoaGMDq'

OA_TOKEN = '1205933898133364737-ztmx81WMa4mb1KxPmy9zCT3EkG7wYb'
OA_SECRET = 'LqI7Ek4rpfImiLvRMAhVNX2PadhBAjCq3sujxU6GlJ8H2'

BASE_URI = 'https://api.twitter.com/1.1/'

consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { site: 'https://api.twitter.com', scheme: :header})
token_hash = { oauth_token: OA_TOKEN, oauth_token_secret: OA_SECRET }
access_token = OAuth::AccessToken.from_hash(consumer, token_hash)

tweets = JSON.parse(access_token.request(:get, "#{BASE_URI}statuses/home_timeline.json").body)

# google nlp stuff below

ENV["LANGUAGE_PROJECT"]     = " analog-forest-264118"
ENV["LANGUAGE_CREDENTIALS"] = "/Users/mborkowski/Downloads/Flatiron Final Project-08bef8cb5c6b.json"

# Instantiates a client
language = Google::Cloud::Language.new

tweets_result = tweets.each do |tweet|
    response = language.analyze_entities content: tweet["text"], type: :PLAIN_TEXT

    entities = response.entities

    entities.each do |entity|
        if (entity.type === :LOCATION)
            puts "success"
            Tweet.create_or_find_by(
            twitter_created_at: tweet["created_at"],
            twitter_id: 0, #hard-coded, change later, activerecord couldn't handle huge integer size
            twitter_id_str: tweet["id_str"],
            text: tweet["text"],
            entities: tweet["user"]["entities"],
            hashtags: "",
            media: "",
            media_url: "",
            twitter_user_id: tweet["user"]["id"], 
            twitter_user_id_str: tweet["user"]["id_str"], 
            twitter_user_name: tweet["user"]["name"], 
            twitter_user_screen_name: tweet["user"]["screen_name"], 
            twitter_user_description: tweet["user"]["description"], 
            twitter_user_profile_image_url: tweet["user"]["profile_image_url"], 
        )
        end
    end
end


puts "Hello"

# follow1 = Follow.create_or_find_by(user_id: user1.id, twitter_user_id: dad.id)