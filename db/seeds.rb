# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


matt = TwitterUser.create_or_find_by(twitter_id: 76, twitter_id_str: "76", name: "Matt", screen_name:"matt_b", verified: true)
dad = TwitterUser.create_or_find_by(twitter_id: 33, twitter_id_str: "33", name: "Dad", screen_name:"jimbo", verified: false)
tweet1 = Tweet.create_or_find_by(twitter_created_at: "Yesterday", twitter_id: 60405, twitter_id_str: "60405", 
text: "My very first tweet. What's up world this is M Bomb",
 twitter_user_id: matt.id)
tweet2 = Tweet.create_or_find_by(twitter_created_at: "Today", twitter_id: 80111, twitter_id_str: "80111", 
text: "This is M Bomb's dad. Many know me as Jim Borkowski.", twitter_user_id: dad.id)
tweet3 = Tweet.create_or_find_by(twitter_created_at: "Today", twitter_id: 80122, twitter_id_str: "80122", 
text: "From now on, call me Jimbo.", twitter_user_id: dad.id)
tweet4 = Tweet.create_or_find_by(twitter_created_at: "Today", twitter_id: 80123, twitter_id_str: "80123", 
text: "Anyone? Anyone there?", twitter_user_id: dad.id)
tweet5 = Tweet.create_or_find_by(twitter_created_at: "Today", twitter_id: 80987, twitter_id_str: "80987", 
text: "Yes dad I'm here", twitter_user_id: matt.id)
user1 = User.create_or_find_by(username: "first_user", password: "123")
follow1 = Follow.create_or_find_by(user_id: user1.id, twitter_user_id: dad.id)