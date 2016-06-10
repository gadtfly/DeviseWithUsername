require 'rails_helper'

feature "signing up" do
  let(:user) { User.new(username: 'testuser', email: 'test@example.com', password: '12345678') }

  scenario "with email alone is unsuccessful" do
    visit('/')
    click_link('Sign Up')
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    fill_in('Password confirmation', with: user.password)
    click_button('Sign up')
    expect(page).to_not have_content('signed up successfully')
    expect(page).to have_content('error')
  end

  scenario "with username and email is successful" do
    visit('/')
    click_link('Sign Up')
    fill_in('Username', with: user.username)
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    fill_in('Password confirmation', with: user.password)
    click_button('Sign up')
    expect(page).to have_content('signed up successfully')
  end
end
