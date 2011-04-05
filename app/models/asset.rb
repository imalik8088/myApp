class Asset < ActiveRecord::Base
  
  belongs_to :meeting
  
  has_attached_file :asset, :styles => { :large => "640x480", :medium => "300x300>", :thumb => "100x100>" },
                    :url  => "/assets/meetings/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/meetings/:id/:style/:basename.:extension"
                    
end
