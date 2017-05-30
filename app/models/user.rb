class User < ActiveRecord::Base
  has_secure_password
  has_many :properties
  has_many :favorites
  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, length: {minimum: 6}
end
