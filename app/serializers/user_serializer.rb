class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username

  attributes :twitter_users do |object|
    follows = Follow.all.select do |follow|
      follow.user_id == object.id
    end

    follows.map do |follow|
      follow = TwitterUser.find_by(id: follow.twitter_user_id)
    end
  end
end
