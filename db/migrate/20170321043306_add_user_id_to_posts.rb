class AddUserIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end

# The was the idea I had to create a user_id for the posts, but it wasn't right as it added a column instead. Perhaps Walkers adds a column as well though it seems explicit to having a user id
# class AddUserIdToPosts < ActiveRecord::Migration[5.0]
#   def change
#     add_column :posts, :user_id, :integer
#   end
# end
# This is the first attempt though I didn't write it in the correct syntax and it created 2 columns both of which were strings because I didn't join the attribute and data type by a colon like this: attribute:data_type
# class AddUserIdToPosts < ActiveRecord::Migration[5.0]
#   def change
#     add_column :posts, :user_id, :string
#     add_column :posts, :integer, :string
#   end
# end
