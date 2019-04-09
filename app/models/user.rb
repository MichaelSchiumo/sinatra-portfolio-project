class User < ActiveRecord::Base
  has_many :exercises
  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  #add HTML validations (require + input tags)
  #activerecord validations!!! (uniqueness)
  #one or the other
end
