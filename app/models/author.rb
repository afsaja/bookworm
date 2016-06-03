class Author < ActiveRecord::Base

  #Validations
  validates :bio, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => { :scope => :dob}
  validates :image_url, :presence => true
  validates :dob, :presence => true

#Associations
  has_many :books
  has_many :users, :through => :books
  
end
