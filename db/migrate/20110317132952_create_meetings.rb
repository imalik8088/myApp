class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.string :location
      t.string :city
      t.datetime :date
      t.text :description
	    t.references :school

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
