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

end
