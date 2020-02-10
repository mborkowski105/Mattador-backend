class AddLatLongToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :lat, :integer
    add_column :tweets, :long, :integer
  end
end
