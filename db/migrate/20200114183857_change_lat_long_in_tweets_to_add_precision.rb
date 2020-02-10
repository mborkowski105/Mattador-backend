class ChangeLatLongInTweetsToAddPrecision < ActiveRecord::Migration[6.0]
  def change
    change_column :tweets, :lat, :decimal, :precision => 17, :scale => 14
    change_column :tweets, :long, :decimal, :precision => 17, :scale => 14
  end
end
