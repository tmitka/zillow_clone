class Property < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :images
  validates :bedrooms, :bathrooms, :zipcode, :price, :sq_ft, presence: true
  validates :description, :address, presence: true, length: {minimum: 5}
  geocoded_by :address
  after_validation :geocode
end
