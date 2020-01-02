class Tweet < ApplicationRecord
    belongs_to :twitter_user, optional: true
end
