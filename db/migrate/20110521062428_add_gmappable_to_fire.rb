class AddGmappableToFire < ActiveRecord::Migration
  def self.up
    add_column :fires, :latitude, :float
    add_column :fires, :longitude, :float
    add_column :fires, :gmaps, :boolean
  end

  def self.down
    remove_column :fires, :gmaps
    remove_column :fires, :longitude
    remove_column :fires, :latitude
  end
end
