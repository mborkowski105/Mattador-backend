class AddColumnsToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :entities, :string
    add_column :tweets, :hashtags, :string
    add_column :tweets, :media, :string
    add_column :tweets, :media_url, :string
  end
end
