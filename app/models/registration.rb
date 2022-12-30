class Registration < ApplicationRecord
  validates :name,:email,:password,presence:true
  validates :name,:email ,uniqueness:true
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
end
