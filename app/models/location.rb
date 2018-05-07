class Location < ApplicationRecord::Base
  has_many :events
end
