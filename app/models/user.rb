class User < ActiveRecord::Base

require 'bcrypt'
  attr_accessible :email, :name, :password_confirmation , :avatar, :assets, :password, :user_id, :isadmin, :albums
  attr_accessor :password
  before_save :encrypt_password

  has_many :assets, dependent: :destroy
  has_many :albums, dependent: :destroy
  
 
  
  has_attached_file :avatar,:dependent => :destroy, :default_url => '/defaultProfile.png'

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :name, :on => :create
  validates_uniqueness_of :email
  validates_uniqueness_of :name

def self.authenticate_by_email(email, password)
  user = find_by_email(email)
  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    user
  else
    nil
  end
end

def self.authenticate_by_name(name, password)
  user = find_by_name(name)
  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    user
  else
    nil
  end
end

def encrypt_password
	if password.present?
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
end


  
	#EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
	#validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	#validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	#validates :password, :confirmation => true #password_confirmation attr
	#validates_length_of :password, :in => 6..20, :on => :create

			
# after_save :clear_password
# def encrypt_password
  # if password.present?
    # self.salt = BCrypt::Engine.generate_salt
    # self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
  # end
# end
# def clear_password
  # self.password = nil
# end
	 # def self.authenticate(email, password)
    # find_by_email(email).try(:authenticate, password)
  # end

# def match_password(login_password="")
	# encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
# end

end
