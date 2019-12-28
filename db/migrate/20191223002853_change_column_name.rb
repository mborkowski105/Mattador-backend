class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :tweets, :tweet_id, :twitter_id
  end
end
