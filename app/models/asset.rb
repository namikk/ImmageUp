class Asset < ActiveRecord::Base	
attr_accessible :asset
belongs_to :user
has_attached_file :asset

end
