class Comment < ActiveRecord::Base
#Looks good
  belongs_to :post
  belongs_to :user
end
