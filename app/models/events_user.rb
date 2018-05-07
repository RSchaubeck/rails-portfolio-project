class EventsUser < ApplicationRecord::Base
  belongs_to :event
  belongs_to :user
end
