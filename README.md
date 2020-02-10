Lunchador (backend)

I wrote this app as my final project at the Flatiron School. This is a mobile app, written in React Native and targetted towards Android users, with the purpose of consolidating as many NYC food truck locations into one, easily manageable place for convenient viewing. I do so by tracking the tweets of a curated list of active food Twitter accounts. Through OAuth, I pull relevant data from these tweets (content, usernames, profile images). I then employ the Google Natural Language API's capabilities of breaking a block of text into chunks, or "entities". If an entity is identified as a location, this means that the tweet has passed the test, and will be saved for storage in the backend, to be displayed. In the meantime, those locations will be combined into one search term and thrown into the Google Geocoder API, with the purpose of getting back a longitude and latitude. The longitude and latitude will be necessary for what we want, which is to throw a pin onto a Google Maps view representing that tweeted location.

The backend is set up in order to store/model Tweets and Twitter accounts/ their relationships with users that follow them. This can be used for other applications - I've used this backend for a different project (a news aggregator).

Demo

https://share.getcloudapp.com/WnuELqdw

Want To Try This App?

This app makes use of my personal external API keys for Twitter and various Google API usage. I've removed them to limit any API calls I'm not aware of, so I don't get billed. If you'd like to try this app for yourself, please contact me and I might be able to get you some keys.

Pull the code, bundle install, set up your database, then the db:seed file will contain what you need to get some tweets in your database.

You will also need to pull the code from my frontend if you want to run the mobile app. Otherwise, this is just an API.
