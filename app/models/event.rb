class Event < ActiveRecord::Base
  belongs_to :location
  has_many :events_user
  has_many :users, through: :events_user
  before_validation :datetime_format
  before_create :datetime_format
  validates :name, :start, :end, :presence => true


  attr_accessor :location_name, :year, :month, :day, :start_hour, :start_minutes, :end_hour, :end_minutes

  def datetime_format
    y = self.year
    m = self.month
    d = self.day
    sh = self.start_hour
    sm = self.start_minutes
    eh = self.end_hour
    em = self.end_minutes
    self.start = "#{y}-#{m}-#{d} #{sh}:#{sm}:00".to_datetime
    self.end = "#{y}-#{m}-#{d} #{eh}:#{em}:00".to_datetime
  end

  def day
    self.start.strftime('%v')
  end

  def time
    time1 = self.start.strftime('%r')
    time2 = self.end.strftime('%r')
    "#{time1} - #{time2}"
  end

end
