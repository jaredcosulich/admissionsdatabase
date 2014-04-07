class Family < ActiveRecord::Base
  has_many :students
  belongs_to :address
  belongs_to :newsletter_option  
end
