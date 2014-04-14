class AddCommentsToFamily < ActiveRecord::Migration
  def change
    add_column :families, :comments, :text
  end
end
