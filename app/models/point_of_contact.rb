class PointOfContact < ActiveRecord::Base
  belongs_to :family
  belongs_to :point_of_contact_type
end
