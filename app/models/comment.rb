class Comment < ActiveRecord::Base
  belongs_to :post
  before_save { self.commenter = current_user.display_name } 

end
