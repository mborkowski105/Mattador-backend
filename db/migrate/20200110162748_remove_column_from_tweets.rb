class RemoveColumnFromTweets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tweets, :twitter_user_id
  end
end
