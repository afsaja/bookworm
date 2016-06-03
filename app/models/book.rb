class Book < ActiveRecord::Base
  #Validations
  validates :title, :presence => true, :uniqueness => {:scope => :year}
  validates :year, :numericality => {:only_integer => true}
  validates :length, :numericality => {:only_integer => true}
  validates :description, :presence => true, :uniqueness => true

  #Associations
  belongs_to :author
  has_many :favorites
  has_many :comments
  has_many :users, :through => :favorites
end
