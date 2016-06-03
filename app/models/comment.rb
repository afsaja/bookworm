class Comment < ActiveRecord::Base
  #No Validations

  #Associations
  belongs_to :book
  belongs_to :user
end
