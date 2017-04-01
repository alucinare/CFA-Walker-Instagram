class Comment < ApplicationRecord
  # These were created when we used user:references and post:references to specify the relationship between this model and the other 2 models, this model belongs to the other 2 models because a post has a comment and a user makes a comment.
  belongs_to :user
  belongs_to :post

end
