class Event < ActiveRecord::Base
  belongs_to :location
  has_many :events_user
  has_many :users, through: :events_user
  validates :name, :start, :end, :presence => true

  attr_accessor :location_name

end
