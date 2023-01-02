class Registration < ApplicationRecord
  validates :name,:email,:password,presence:true
  validates :name,:email ,uniqueness:true
  validates :email,:email => true

end
