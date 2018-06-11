class User < ApplicationRecord::Base
  has_many :events_user
  has_many :events, through: :events_user
  validates :first_name, :last_name, :username, :presence => true
  validates :username, :length => { :in => 5..20}, :unqueness => true
  has_secure_password
end
