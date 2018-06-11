class Location < ActiveRecord::Base
  has_many :events
  validates :name, :address, :presence => true
end
