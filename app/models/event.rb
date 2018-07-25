class Event < ActiveRecord::Base
  belongs_to :location
  has_many :events_user
  has_many :users, through: :events_user
  validates :name, presence: true
  validate :same_time?

  def same_time?
    if self.start == self.end_time
      errors.add(:start, "time can't be the same as end time.")
    end
  end

  def readable_time(time_attr)
    time_attr.strftime('%A, %d %b %Y %l:%M %p')
  end

  def self.pop_events
    popular_ids = EventsUser.group(:event_id).order('count_all DESC').limit(5).count
    event_keys = popular_ids.keys
    pop_events = event_keys.collect do |e|
      Event.find(e.to_i)
    end
  end

end
