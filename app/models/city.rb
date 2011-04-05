class City < ActiveRecord::Base
has_many :schools

validates :name,	:presence => true,
					:length => 3..30
					
end
