class CreateFires < ActiveRecord::Migration
  def self.up
    create_table :fires do |t|
      t.integer :incident_num
      t.string :type
      t.string :location
      t.string :station
      t.string :unit
      t.datetime :alarm
      t.datetime :arrival
      t.datetime :controlled

      t.timestamps
    end
  end

  def self.down
    drop_table :fires
  end
end
