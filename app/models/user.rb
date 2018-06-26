class User < ActiveRecord::Base
  has_many :events_user
  has_many :events, through: :events_user
  before_validation :downcase_email
  before_create :downcase_email
  validates :first_name, :last_name, :presence => true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password validations: false

  def downcase_email
    self.email.downcase!
  end

end
