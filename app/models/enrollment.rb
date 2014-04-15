class Enrollment < ActiveRecord::Base
  belongs_to :student
  
  def info
    "#{start.strftime('%m/%d/%Y')} - #{self.end.strftime('%m/%d/%Y') unless self.end.blank?}"
  end
end
