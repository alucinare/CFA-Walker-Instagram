class User < ApplicationRecord
  # SELF CREATED
  # I added this, but this isn't enough
  # has_many :post
  # I have to have added this as well
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  # SELF CREATED
  # this is a form of validation for a user_name, it must have a min and max length
  validates :user_name, presence: true, length: { minimum: 4,
       maximum: 16 }

  # DEVISE CREATED
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
