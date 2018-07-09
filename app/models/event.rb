class Event < ActiveRecord::Base
  belongs_to :location
  has_many :events_user
  has_many :users, through: :events_user
  validates :name, :start, :end_time, :presence => true

  def readable_time(time_attr)
    time_attr.strftime('%A, %d %b %Y %l:%M %p')
  end

end
