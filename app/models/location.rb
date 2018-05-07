class Location < ApplicationRecord::Base
  has_many :events
  validates :name, :address, :presence => true
end
