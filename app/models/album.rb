class Album < ActiveRecord::Base
  attr_accessible :albumName, :description, :albumAvatar, :assets
  belongs_to :user
  has_many :assets, dependent: :destroy
  
  validates_uniqueness_of :albumName, :scope => [:user_id]
  
  has_attached_file :albumAvatar,:dependent => :destroy, :default_url => '/defaultAlbumProfile.png'
end
