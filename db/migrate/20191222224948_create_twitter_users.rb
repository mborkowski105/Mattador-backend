class CreateTwitterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :twitter_users do |t|
      t.integer :twitter_id
      t.string :twitter_id_str
      t.string :name
      t.string :screen_name
      t.boolean :verified

      t.timestamps
    end
  end
end
