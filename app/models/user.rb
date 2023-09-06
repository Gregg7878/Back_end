class User < ApplicationRecord
 
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
    validates :password, presence: true, length: { minimum: 6 }
  
   
    has_secure_password
  end