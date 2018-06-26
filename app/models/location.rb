class Location < ActiveRecord::Base
  has_many :events
  validates :name, :address, :presence => true

  def capitalized_names
    name.capitalize
  end

end
