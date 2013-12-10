class Post < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 5 }

belongs_to :user
has_many :comments
# before_save { self.poster = current_user.display_name } 
end
