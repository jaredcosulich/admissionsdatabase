class Family < ActiveRecord::Base
  has_many :students
  has_many :referrals
  has_many :point_of_contacts
  
  belongs_to :address
  belongs_to :newsletter_option  
  
  def name
    "#{parent_1_name}, #{parent_2_name}"
  end
  
end
