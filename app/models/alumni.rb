class Alumni < ActiveRecord::Base
  
  belongs_to :school
  has_many :alumni_meeting
  has_many :meetings, :through => :alumni_meeting

  scope :my_classmates, lambda {|year, school| where(:graduation_year => year, :school_id => school)}

  validates :first_name,	:presence => true, :length => 3..20
  validates :last_name,	:presence => true, :length => 3..20
  validates :graduation_year,	:presence => true, :numericality => true
  validates :email,	:presence => true,
                    #:format => {:with => /[a-zA-Z\.\-]+@[a-zA-Z\.\-]+/},
  					        :uniqueness => true


  
  has_attached_file :photo, :styles => { :small => "150x150>" },
                    :url  => "/assets/alumnis/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/alumnis/:id/:style/:basename.:extension"
                    
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

validates_confirmation_of :password, :if => proc {|u| !u.password.nil?}
					
#Setter + Getter
attr_accessor :password, :password_confirmation

before_save :crypt_password


#Benutzer Authentifikation
def self.authenticate(email, password)
    if alumni = self.find_by_email(email)
		hash = Digest::SHA256.hexdigest(password)
		if hash == alumni.hashed_password
			return alumni
		end
    end
end

#Password hash Methode
def crypt_password
	unless password.blank?
		self.hashed_password = Digest::SHA256.hexdigest(password)
	end
end

end
