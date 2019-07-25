class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :name, presence: true
  validates :profile, presence: true

  has_one_attached :avatar
  has_many :tweets
  has_many :comments 
end
