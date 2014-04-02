class Family < ActiveRecord::Base
  has_many :students
  belongs_to :address  
end
