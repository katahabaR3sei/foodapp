class User < ApplicationRecord
  validates :name, presence:true,
                   length:{maximum:15}
  
  VALID_EMAIL_REGEX = /[a-zA-Z0-9._+]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*/
  validates :email, presence:true,
             format:{with:VALID_EMAIL_REGEX}

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
  validates :password, presence:true, 
                       length: {minimum: 8, maximum: 32,},
                       format:{with:VALID_PASSWORD_REGEX}
  validates :sex, presence:true
  validates :age, presence:true 
  has_secure_password 
  validates :email, presence: true, uniqueness: true

  has_many :shops
end
