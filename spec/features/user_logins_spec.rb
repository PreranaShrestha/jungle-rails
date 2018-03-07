require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
   before :each do
    @user = User.create!(
      first_name: 'First User',
      last_name: 'last Name',
      email: 'first@user.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end
  scenario "They see a specific products" do
    # ACT

    visit '/login'
    fill_in(placeholder: 'User Name', :with => 'first@user.com')
    fill_in(placeholder: 'Password', :with => '123456')
    click_button 'Submit'
    click_link('User')
    sleep(5)
    save_screenshot "test.png"
    page.should have_content('Logout')
  end
end
