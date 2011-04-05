class AddColumnYearToMeeting < ActiveRecord::Migration
  def self.up
    add_column :meetings, :graduation_year, :integer
  end

  def self.down
    remove_column :meetings, :graduation_year
  end
end