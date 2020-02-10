class ChangeLatLongInTweetsToStringRedux < ActiveRecord::Migration[6.0]
  def change
    change_column :tweets, :lat, :string
    change_column :tweets, :long, :string
  end
end
