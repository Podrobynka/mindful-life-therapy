class AddLatitudeAndLongitudeToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :latitude, :float
    add_column :settings, :longitude, :float
  end
end
