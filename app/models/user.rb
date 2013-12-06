class User < ActiveRecord::Base
validates :firstname, presence: true

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
validates :password, length: { minimum: 6 }

before_save { self.email = email.downcase } 

has_secure_password #This adds a ton of things to the app, in one line. Most notably, it adds all pass confirmation steps.
end
