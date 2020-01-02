class User < ApplicationRecord
    has_many :twitter_users, through: :follows, dependent: :destroy
    # has_secure_password
    validates :username, uniqueness: { case_sensitive: false }, presence: true
end
