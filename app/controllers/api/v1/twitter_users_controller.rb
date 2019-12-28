class Api::V1::TwitterUsersController < ApplicationController
    def index
        twitter_users = TwitterUser.all
        render json:twitter_users, status: 200
    end

    def show_tweets
        @twitter_user = TwitterUser.find_by(id: params[:id])
        tweets = Tweet.all.select do |tweet|
            tweet.twitter_user_id == @twitter_user.id
        end

        render json:tweets, status: 200
    end
end
