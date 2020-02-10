class AddUserColumnsToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :twitter_user_id, :integer
    add_column :tweets, :twitter_user_id_str, :string
    add_column :tweets, :twitter_user_name, :string
    add_column :tweets, :twitter_user_screen_name, :string
    add_column :tweets, :twitter_user_description, :string
    add_column :tweets, :twitter_user_profile_image_url, :string
  end
end
