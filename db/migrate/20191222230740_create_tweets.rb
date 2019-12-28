class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :twitter_created_at
      t.integer :tweet_id
      t.string :tweet_id_str
      t.string :text
      t.integer :twitter_user_id

      t.timestamps
    end
  end
end
