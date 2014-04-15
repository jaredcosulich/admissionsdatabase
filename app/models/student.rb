class Student < ActiveRecord::Base
  belongs_to :address
  belongs_to :family
  has_many :enrollments  
end
