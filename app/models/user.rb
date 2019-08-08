require 'bcrypt'
#require 'user'

class User < ActiveRecord::Base #ApplicationRecord
  has_many :bookmarks, :dependent => :destroy
	 # users.password_hash in the database is a :string
  
  include BCrypt
  #gives User model authentication methods via bcrypt

  has_secure_password(validations: false)

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password

    #storable_string = hashed_password.to_s
    #restored_hash = BCrypt::Password.new storable_string


  end
  #ensures duplicate emails not registered
    validates :email, uniqueness: true
  #email confirmation, not case sensitive 
    validates :email, confirmation: { case_sensitive: false }
    validates :email_confirmation, presence: true

end

