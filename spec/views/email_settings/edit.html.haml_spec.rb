require 'spec_helper'

describe "email_settings/edit" do
  before(:each) do
    @email_setting = assign(:email_setting, stub_model(EmailSetting,
      :user_id => 1,
      :email => "MyString",
      :weekly_newsletter => false
    ))
  end

  it "renders the edit email_setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", email_setting_path(@email_setting), "post" do
      assert_select "input#email_setting_user_id[name=?]", "email_setting[user_id]"
      assert_select "input#email_setting_email[name=?]", "email_setting[email]"
      assert_select "input#email_setting_weekly_newsletter[name=?]", "email_setting[weekly_newsletter]"
    end
  end
end
