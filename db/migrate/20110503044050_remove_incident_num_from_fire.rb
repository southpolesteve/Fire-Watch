class RemoveIncidentNumFromFire < ActiveRecord::Migration
  def self.up
    remove_column :fires, :incident_num
  end

  def self.down
    add_column :fires, :incident_num, :integer
  end
end
