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
require "rest-client"
require "geocoder"
require "json"

def query_stringify(string)
    string.gsub!(' ', '+')
end

# twitter stuff below

CONSUMER_KEY = 'VKxuVzTfght5w6O5S6AWUpTMb'
CONSUMER_SECRET = 'qCDq9iM1iuDSQAEkV9HVJKSR6r3ShQJK1nAtybOtcwkSoaGMDq'

OA_TOKEN = '1205933898133364737-ztmx81WMa4mb1KxPmy9zCT3EkG7wYb'
OA_SECRET = 'LqI7Ek4rpfImiLvRMAhVNX2PadhBAjCq3sujxU6GlJ8H2'

BASE_URI = 'https://api.twitter.com/1.1/'

consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { site: 'https://api.twitter.com', scheme: :header})
token_hash = { oauth_token: OA_TOKEN, oauth_token_secret: OA_SECRET }
access_token = OAuth::AccessToken.from_hash(consumer, token_hash)

#first we get all the tweets from my home timeline with the line of code below

# tweets = JSON.parse(access_token.request(:get, "#{BASE_URI}statuses/home_timeline.json").body)

# google nlp stuff below

ENV["LANGUAGE_PROJECT"]     = " analog-forest-264118"
ENV["LANGUAGE_CREDENTIALS"] = "/Users/mborkowski/Downloads/Flatiron Final Project-08bef8cb5c6b.json"

# Instantiates a client
language = Google::Cloud::Language.new


#for each tweet, if Google NLP determines it contains a location, the tweet gets saved to my backend

# tweets_result = tweets.each do |tweet|
#     response = language.analyze_entities content: tweet["text"], type: :PLAIN_TEXT

#     #breaks Google NLP response into chunks, known as entities
#     entities = response.entities

#     entities.each do |entity|
#         if (entity.type === :LOCATION)
#             puts entity.name
#             # geocode_result = Geocoder.search("#{entity.name} New York")
#             # if !(geocode_result.empty?)
#             #     puts entity.name
#             #     lat = geocode_result[0].data["lat"].to_f
#             #     long = geocode_result[0].data["long"].to_f

#                 # Tweet.create_or_find_by(
#                 # twitter_created_at: tweet["created_at"],
#                 # twitter_id: 0, #hard-coded, change later, activerecord couldn't handle huge integer size
#                 # twitter_id_str: tweet["id_str"],
#                 # text: tweet["text"],
#                 # entities: tweet["user"]["entities"],
#                 # hashtags: "",
#                 # media: "",
#                 # media_url: "",
#                 # twitter_user_id: tweet["user"]["id"], 
#                 # twitter_user_id_str: tweet["user"]["id_str"], 
#                 # twitter_user_name: tweet["user"]["name"], 
#                 # twitter_user_screen_name: tweet["user"]["screen_name"], 
#                 # twitter_user_description: tweet["user"]["description"], 
#                 # twitter_user_profile_image_url: tweet["user"]["profile_image_url"],
#                 # lat: lat,
#                 # long: long 
#                 # )
#             # end   
#         end
#     end
# end

tweets_result = Tweet.all.each do |tweet|
    response = language.analyze_entities content: tweet["text"], type: :PLAIN_TEXT
    entities = response.entities

    #collects/concatenates all location entities into single query string with "New York" appended onto the end
    entity_query_string = ""
    entities.each do |entity|
        ##blacklists entities that are literally named "location"
        if (entity.type === :LOCATION && !(entity.name === "location"))
            # RestClient.get "https://maps.googleapis.com/maps/api/geocode/json?address=11+Broadway+Manhattan&key=AIzaSyCopQ2UMpO6wvj0qDZd77fbUvSjMOor3Ns"
            entity_query_string.concat(" #{entity.name}")
        end
    end

    #removes "&" if it appears in text, appends "New York" onto end
    entity_query_string.gsub!('&', '')
    entity_query_string.concat(" New York")
    query_stringify(entity_query_string)
    entity_query_string
    geocoder = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{entity_query_string}&key=AIzaSyCopQ2UMpO6wvj0qDZd77fbUvSjMOor3Ns"))
    lat = geocoder["results"][0]["geometry"]["location"]["lat"].to_s
    long = geocoder["results"][0]["geometry"]["location"]["lng"].to_s
    puts lat
    puts long
    tweet.update({lat: lat, long: long})
end

pp tweets_result

puts "Hello"

# follow1 = Follow.create_or_find_by(user_id: user1.id, twitter_user_id: dad.id)