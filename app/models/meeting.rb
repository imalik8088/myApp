class Meeting < ActiveRecord::Base
    
  has_many :comments, :dependent => :destroy
  belongs_to :school
  has_many :alumni_meeting
  has_many :alumnis, :through => :alumni_meeting
  
   has_many :assets
   attr_accessible :location, :city, :description, :date, :assets_attributes
   accepts_nested_attributes_for :assets, :allow_destroy => true    
   
   scope :my_meetings, lambda {|year, school| where(:graduation_year => year, :school_id => school)}
  

   validates :location,  :presence => true,
             :length => 3..30
   validates :city,      :presence => true,
             :length => 3..30
end
