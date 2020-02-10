class AddColumnToTwitterUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :twitter_users, :profile_image_url, :string
  end
end
