class Follow < ApplicationRecord
    belongs_to :twitter_user
    belongs_to :user
end
