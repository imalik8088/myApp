class Comment < ActiveRecord::Base
belongs_to :meeting

validates :body,	:presence => true
						
end
