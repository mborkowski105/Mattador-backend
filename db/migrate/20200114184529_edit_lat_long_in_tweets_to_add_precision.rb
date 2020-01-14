class EditLatLongInTweetsToAddPrecision < ActiveRecord::Migration[6.0]
  def up
    change_column :tweets, :lat, :decimal, :precision => 8, :scale => 6
    change_column :tweets, :long, :decimal, :precision => 8, :scale => 6
  end

  def down
    change_column :tweets, :lat, :decimal
    change_column :tweets, :long, :decimal
  end
end
