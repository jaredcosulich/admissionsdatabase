class PointOfContact < ActiveRecord::Base
  belongs_to :family
  belongs_to :point_of_contact_type

  def title
    date.strftime('%m/%d/%Y')
  end 
end
