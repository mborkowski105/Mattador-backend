class TwitterUser < ApplicationRecord
    has_many :tweets
    has_many :users, through: :follows
end
