class User < ApplicationRecord

    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                      format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
    validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  

    has_secure_password
  
    has_many :activities
  end
  