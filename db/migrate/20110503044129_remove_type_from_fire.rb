class RemoveTypeFromFire < ActiveRecord::Migration
  def self.up
    remove_column :fires, :type
  end

  def self.down
    add_column :fires, :type, :string
  end
end
