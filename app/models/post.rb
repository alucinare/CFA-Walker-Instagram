class Post < ApplicationRecord # this is a model

  #apparently this is a way to plug up a security hole in which accessing the database is done through mass assignment
  # this may not be needed as the video was made in 2011
  # TO INDEX - 27 :commenting out this let me access my captions
  # attr_accessor :image, :caption
  # this is specific to the paperclip gem, it's on paperclip documentation
  has_attached_file :image

  # this is from paperclip documentation
  validates :image, presence: true
  has_attached_file :image #, styles: { :medium => "640x" } this line had to be commented out because it was interfering with uploading an image through ImageMagick. I'm not sure how to make it a default style... maybe I can do it in HTML and CSS??
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  

end
