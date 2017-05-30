class User < ActiveRecord::Base
  has_secure_password
  has_many :properties
  has_many :favorites
end
