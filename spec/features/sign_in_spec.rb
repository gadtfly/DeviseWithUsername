require 'rails_helper'

feature "signing in" do
  let(:user) { User.create!(username: 'testuser', email: 'test@example.com', password: '12345678') }

  scenario "with email is successful" do
    visit('/')
    click_link('Sign In')
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Log in')
    expect(page).to have_content('Signed in successfully')
  end
end