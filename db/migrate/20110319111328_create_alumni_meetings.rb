class CreateAlumniMeetings < ActiveRecord::Migration
  def self.up
    create_table :alumni_meetings do |t|
      t.references :alumni
	  t.references :meeting 
	  t.boolean :invited, :default => false
	  t.boolean :status, :default => false
	  
      t.timestamps
    end
  end

  def self.down
    drop_table :alumni_meetings
  end
end
