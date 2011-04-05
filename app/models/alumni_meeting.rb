class AlumniMeeting < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :alumni
	

end
