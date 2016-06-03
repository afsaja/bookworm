class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true, :uniqueness => true



#Associations
  has_many :comments

  has_many :favorites

  has_many :authors, :through => :books
  has_many :books, :through => :favorites
end
