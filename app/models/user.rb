class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :avatar, presence: true
  validates :email, presence: true

  has_one_attached :avatar
  has_many :tweets
  has_many :comments 
end
