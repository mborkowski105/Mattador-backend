class Api::V1::TweetsController < ApplicationController
    def index
        tweets = Tweet.all
        render json:tweets, status: 200
    end
end
