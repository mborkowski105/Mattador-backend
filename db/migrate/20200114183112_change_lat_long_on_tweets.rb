class ChangeLatLongOnTweets < ActiveRecord::Migration[6.0]
  def change
    change_column :tweets, :lat, :decimal
    change_column :tweets, :long, :decimal
  end
end
