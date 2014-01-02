class Post < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 5 }
  #Fixed indentation
  belongs_to :user
  has_many :comments
# before_save { self.poster = current_user.display_name } 
end
