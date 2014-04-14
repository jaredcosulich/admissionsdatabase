class AddCommentsToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :comments, :text
  end
end
