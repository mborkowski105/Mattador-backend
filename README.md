Lunchador (backend)

A note from the author

This code is not supported! I wrote this more than 2 years ago, and since then, there have been several major versions of Ruby and Rails. The breaking features should be, in particular, anything using Google API's.

If you'd like to see this project in action, I'd recommend watching the video walkthrough below. If you have any further questions, please feel free to contact me.

######################################################

I wrote this app as my final project at the Flatiron School. This is a mobile app, written in React Native and targetted towards Android users, with the purpose of consolidating as many NYC food truck locations into one, easily manageable place for convenient viewing. I do so by tracking the tweets of a curated list of active food Twitter accounts. Through OAuth, I pull relevant data from these tweets (content, usernames, profile images). I then employ the Google Natural Language API's capabilities of breaking a block of text into chunks, or "entities". If an entity is identified as a location, this means that the tweet has passed the test, and will be saved for storage in the backend, to be displayed. In the meantime, those locations will be combined into one search term and thrown into the Google Geocoder API, with the purpose of getting back a longitude and latitude. The longitude and latitude will be necessary for what we want, which is to throw a pin onto a Google Maps view representing that tweeted location.

The backend is set up in order to store/model Tweets and Twitter accounts/ their relationships with users that follow them. This can be used for other applications - I've used this backend for a different project (a news aggregator).

Demo

https://share.getcloudapp.com/WnuELqdw

Want To Try This App?

