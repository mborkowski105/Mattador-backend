class Api::V1::UsersController < ApplicationController
    def index
        users = User.all
        users_json = users.map do |user|
            return UserSerializer.new(user).serialized_json
        end

        render json:users_json, status: 200
    end
    
    def show
        user = User.find(params[:id])
        user_json = UserSerializer.new(user).serialized_json
        render json:user_json, status: 200
    end
end
