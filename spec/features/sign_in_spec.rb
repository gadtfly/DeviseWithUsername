require 'rails_helper'

feature "signing in" do
  let(:user) { User.create!(username: 'testuser', email: 'test@example.com', password: '12345678') }

  scenario "with username is successful" do
    visit('/')
    click_link('Sign In')
    fill_in('Username or email', with: user.username)
    fill_in('Password', with: user.password)
    click_button('Log in')
    expect(page).to have_content('Signed in successfully')
  end

  scenario "with email is successful" do
    visit('/')
    click_link('Sign In')
    fill_in('Username or email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Log in')
    expect(page).to have_content('Signed in successfully')
  end

  scenario "with wrong credentials retains 'Username or email' field" do
    visit('/')
    click_link('Sign In')
    fill_in('Username or email', with: user.email)
    fill_in('Password', with: '')
    click_button('Log in')
    expect(page).to_not have_content('Signed in successfully')
    expect(page.find_field('Username or email').value).to eq(user.email)
  end
end
