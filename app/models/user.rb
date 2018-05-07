class User < ApplicationRecord::Base
  has_many :events_user
  has_many :events, through: :events_user
end
