require 'rails_helper'

feature "signing out" do
  let(:user) { User.create!(username: 'testuser', password: '12345678') }
  
  before do
    visit('/')
    click_link('Sign In')
    fill_in('Username', with: user.username)
    fill_in('Password', with: user.password)
    click_button('Log in')
  end

  scenario "is succesful" do
    visit('/')
    click_link('Sign Out')
    expect(page).to have_content('Signed out successfully')
  end
end
