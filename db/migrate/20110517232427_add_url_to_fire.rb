class AddUrlToFire < ActiveRecord::Migration
  def self.up
    add_column :fires, :url, :string
  end

  def self.down
    remove_column :fires, :url
  end
end
