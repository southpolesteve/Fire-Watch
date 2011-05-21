class RenameTimeColumns < ActiveRecord::Migration
  def self.up
    rename_column :fires, :alarm, :alarm_at
    rename_column :fires, :arrival, :arrival_at
    rename_column :fires, :controlled, :controlled_at
  end

  def self.down
    rename_column :fires, :alarm_at, :alarm
    rename_column :fires, :arrival_at, :arrival
    rename_column :fires, :controlled_at, :controlled
  end
end

