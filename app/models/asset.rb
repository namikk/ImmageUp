class Asset < ActiveRecord::Base
  attr_accessible :asset
  belongs_to :user
  belongs_to :album
  has_attached_file :asset, dependent: :destroy
  
  validates_attachment_presence :asset  
  validates_attachment_content_type :asset, 
  :content_type => /^image\/(png|gif|jpeg|jpg)/
  
   
end
