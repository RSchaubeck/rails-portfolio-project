class Location < ActiveRecord::Base
  has_many :events
  before_save {|loc| loc.name = loc.name.downcase}
  validates :name, :address, :zip_code, presence: true
  validates :address, uniqueness: { scope: [:zip_code] }

  def capitalized_names
    name.titleize
  end

end
