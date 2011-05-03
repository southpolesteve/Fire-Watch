class AddFireTypeToFire < ActiveRecord::Migration
  def self.up
    add_column :fires, :fire_type, :string
  end

  def self.down
    remove_column :fires, :fire_type
  end
end
