class User < ActiveRecord::Base
validates :first_name, presence: true
validates :display_name, presence: true

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
validates :password, length: { minimum: 6 }

before_save { self.email = email.downcase } 
before_create :create_remember_token

has_secure_password #This adds a ton of things to the app, in one line. Most notably, it adds all pass confirmation steps.
end
 
 def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end