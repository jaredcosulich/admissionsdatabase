class Student < ActiveRecord::Base
  belongs_to :address
  belongs_to :family  
end
