class Property < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :images
end
