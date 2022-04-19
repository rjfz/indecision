
require 'rails_helper'

describe "the signin process", type: :feature do
  before :each do
    User.create(email: 'fake3@fakemail.com', password: 'password')
  end

  it "signs me in" do
    visit '/users/sign_in'
    fill_in 'user_email', with: 'fake3@fakemail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Homepage'
  end
end
