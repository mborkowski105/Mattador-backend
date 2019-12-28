class User < ApplicationRecord
    has_many :twitter_users, through: :follows, dependent: :destroy
end
