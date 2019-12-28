class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :twitter_user_id

      t.timestamps
    end
  end
end
