class Notifier < ActionMailer::Base
  default :from => "no-reply@localhost"
  
  def meeting_invitation(alumni, m)
      @meeting = m
      @alumni = alumni
      mail(:to => "#{alumni.email}", :subject => "#{alumni.first_name} - #{alumni.first_name}")
  end
end
