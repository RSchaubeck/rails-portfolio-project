class Event < ApplicationRecord::Base
  belongs_to :location
  has_many :events_user
  has_many :users, through: :events_user
end
