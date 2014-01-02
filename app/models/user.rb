class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :display_name, presence: true
  validates :location, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
# validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase } 
  before_create :create_remember_token

  geocoded_by :location
  after_validation :geocode

  has_many :posts
  has_many :comments
  has_secure_password #This adds a ton of things to the app, in one line. Most notably, it adds all pass confirmation steps.

  #So I pulled the following lines of code, which were originally outside of your User class definition, in here.
  #The way you had it will work, I think, but generally you want to write your class methods as I do below
  #Note the use of the `self` keyword in the method definitions
  #There's another way to add class methods by just defining them within the current class' metaclass, you can access it via `class << self`
  #but don't worry about it.

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end

