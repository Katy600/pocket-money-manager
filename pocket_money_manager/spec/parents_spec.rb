require "rails_helper"
require "sign_up_helper"

feature 'User can sign in' do
  context 'User is not signed in' do
    it 'should diplay a sign up button' do
      visit '/parents'
      expect(page).to have_link('Sign up')
    end

    it 'takes user to a registration page' do
      visit '/parents'
      click_link 'Sign up'
      expect(page).to have_content('First name')
      expect(page).to have_content('Last name')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_button('Submit')
    end

    it 'allows a user to sign up' do
      visit('/parents/new')
      fill_in('parent[first_name]', with: 'Spongebob')
      fill_in('parent[last_name]', with: 'Squarepants')
      fill_in('parent[email]', with: 'bob@bob.com')
      fill_in('parent[password]', with: 'bob123')
      click_button('Submit')
      expect(page).to have_content('Your account has been created')
    end

    it 'will not save a user to the database if there are empty fields in the registration form' do
      visit('/parents/new')
      fill_in('parent[first_name]', with: 'Spongebob')
      fill_in('parent[last_name]', with: '')
      fill_in('parent[email]', with: 'bob@bob.com')
      fill_in('parent[password]', with: 'bob123')
      click_button('Submit')
      expect(page).to have_content("Last name can't be blank")
    end

    it 'checks to ensure that the user is registering with a unique password' do
      sign_up
      visit('/parents/new')
      fill_in('parent[first_name]', with: 'Spongebob')
      fill_in('parent[last_name]', with: 'Squarepants')
      fill_in('parent[email]', with: 'bob@bob.com')
      fill_in('parent[password]', with: 'bob123')
      click_button('Submit')
      expect(page).to have_content('Email has already been taken')
    end
  end

end
