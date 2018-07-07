class Location < ActiveRecord::Base
  has_many :events
  before_create {|loc| loc.name = loc.name.downcase}
  validates :name, :address, :presence => true

  def capitalized_names
    name.titleize
  end

end
