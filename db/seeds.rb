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

# ALL EXTERNAL API KEYS HAVE BEEN REMOVED

# twitter stuff below

CONSUMER_KEY = ''
CONSUMER_SECRET = ''

OA_TOKEN = ''
OA_SECRET = ''

BASE_URI = 'https://api.twitter.com/1.1/'

consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { site: 'https://api.twitter.com', scheme: :header})
token_hash = { oauth_token: OA_TOKEN, oauth_token_secret: OA_SECRET }
access_token = OAuth::AccessToken.from_hash(consumer, token_hash)

#first we get all the tweets from my home timeline with the line of code below

tweets = JSON.parse(access_token.request(:get, "#{BASE_URI}statuses/home_timeline.json").body)

# google nlp stuff below

ENV["LANGUAGE_PROJECT"]     = ""
ENV["LANGUAGE_CREDENTIALS"] = ""

# Instantiates a client
language = Google::Cloud::Language.new

#for each tweet, if Google NLP determines it contains a location, the tweet gets saved to my backend

tweets_result = tweets.each do |tweet|
    response = language.analyze_entities content: tweet["text"], type: :PLAIN_TEXT

    #breaks Google NLP response into chunks, known as entities
    entities = response.entities

    #collects/concatenates all location entities into single query string with "New York" appended onto the end
    entity_query_string = ""

    entities.each do |entity|
        ##blacklists unwanted entities
        if !(entity.name === "location" || entity.name === "NYC" || entity.name === "Jersey" || entity.name === "Italian" || entity.name === "Polish" || entity.name === "San Francisco" || entity.name === "Maine")
            # puts entity.name
            entity_query_string.concat(" #{entity.name}")
        end 
    end

    # tried to use regex rule to clean up data with below code, it isn't working. Would like to fix/implement this later
    # idea is to use regex rule that contains whitelist of words like "ave", "st", "boulevard", then grabs phrase including the previous word
    # example: "52nd st"

    # locationArray = tweet["text"].downcase.scan(/(\w+ ave)|(\w+ st)|(\w+ boulevard)(\w+ avenue)|(\w+ blvd)|(\w+ street)|(\w+ avenue)|(\w+ av)/)
    # locationArray = locationArray.flatten
    # locationArray = locationArray.filter do |a|
    #     !(a === nil)
    # end

    # locationArray = locationArray.filter do |element|
    #     !("59th st and 20th st and Chett ave".include?(element))
    # end

    # locationArray.each do |element|
    #     entity_query_string.concat(" #{element}")
    # end
        
    if (entity_query_string.length > 0)
        entity_query_string.gsub!('&', '')
        entity_query_string.concat(" New York")
        query_stringify(entity_query_string)
        GOOGLE_API_KEY = ""
        geocoder = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{entity_query_string}&key=#{GOOGLE_API_KEY}"))
        lat = geocoder["results"][0]["geometry"]["location"]["lat"].to_s
        long = geocoder["results"][0]["geometry"]["location"]["lng"].to_s

        Tweet.create_or_find_by(
        twitter_created_at: tweet["created_at"],
        twitter_id: 0, #hard-coded, change later, activerecord couldn't handle huge integer size
        twitter_id_str: tweet["id_str"],
        text: tweet["text"],
        entities: tweet["user"]["entities"],
        hashtags: "",
        media: "",
        media_url: "",
        twitter_user_id: 0, #hard-coded, change later, activerecord couldn't handle huge integer size
        twitter_user_id_str: tweet["user"]["id_str"], 
        twitter_user_name: tweet["user"]["name"], 
        twitter_user_screen_name: tweet["user"]["screen_name"], 
        twitter_user_description: tweet["user"]["description"], 
        twitter_user_profile_image_url: tweet["user"]["profile_image_url"],
        lat: lat,
        long: long 
        )
    end
end

puts "Success"
