class User < ActiveRecord::Base
  has_many :events_user
  has_many :events, through: :events_user
  validates :first_name, :last_name, :presence => true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password validations: false
end
