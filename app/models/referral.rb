class Referral < ActiveRecord::Base
  belongs_to :family  
  belongs_to :referral_option
  
end
