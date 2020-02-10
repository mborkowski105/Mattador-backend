class ChangeColumnNameAgain < ActiveRecord::Migration[6.0]
  def change
    rename_column :tweets, :tweet_id_str, :twitter_id_str
  end
end
