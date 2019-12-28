class TwitterUser < ApplicationRecord
    has_many :tweets, dependent: :destroy
    has_many :users, through: :follows, dependent: :destroy
end
