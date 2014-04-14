class AddReferralOptionToReferral < ActiveRecord::Migration
  def change
    add_column :referrals, :referral_option_id, :integer
  end
end
