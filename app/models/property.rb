class Property < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { large: "600x600>m", medium: "300x300>", thumb: "150x150>" },default_url: "/images/german.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :favorites
  has_many :images
  validates :bedrooms, :bathrooms, :zipcode, :price, :longitude, :latitude, :sq_ft, presence: true
  validates :description, :address, presence: true, length: {minimum: 5}
  geocoded_by :address
  after_validation :geocode
end
