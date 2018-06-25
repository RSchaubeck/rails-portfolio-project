class Event < ActiveRecord::Base
  belongs_to :location
  has_many :events_user
  has_many :users, through: :events_user
  validates :name, :start, :end, :presence => true

  attr_accessor :location_name

  def day
    self.start.strftime('%v')
  end

  def time
    time1 = self.start.strftime('%r')
    time2 = self.end.strftime('%r')
    "#{time1} - #{time2}"
  end

end
