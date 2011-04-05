class School < ActiveRecord::Base 
belongs_to :city
has_many :meetings
has_many :alumnis

validates :name,	:presence => true,
					:length => 3..40
end
