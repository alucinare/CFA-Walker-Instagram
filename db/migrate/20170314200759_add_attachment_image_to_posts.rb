class AddAttachmentImageToPosts < ActiveRecord::Migration
  # I think this was created by paperclip and is used to add attachment of an image to the Post model
  def self.up
    change_table :posts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :posts, :image
  end
end
