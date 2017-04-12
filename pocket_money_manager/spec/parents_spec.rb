require "rails_helper"
require "sign_up_helper"
require "sign_in_helper"

feature 'User can sign in' do
  context 'User is not signed in' do
    it 'should diplay a sign up button' do
      visit '/'
      expect(page).to have_link('Sign up')
    end

    it 'takes user to a registration page' do
      visit '/'
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

    it 'allows a user to sign in' do
      sign_up
      fill_in('email', with: 'bob@bob.com')
      fill_in('password', with: 'bob123')
      click_button('Log In')
      expect(page).to have_content('You are now logged in')
    end

    it 'allows user to sign out' do
      sign_up
      sign_in
      click_link('Logout')
      expect(page).to have_content('User logged out')
    end
  end

  context 'Parent is able to complete kid related actions' do
    it 'Checks there is a link to allow a parent to add a kid to their account' do
      sign_up
      sign_in
      expect(page).to have_link('Add an account for your kid')
    end

    it 'takes parents to a kid registration page' do
      sign_up
      sign_in
      click_link 'Add an account for your kid'
      expect(page).to have_content('Name')
      expect(page).to have_content('Username')
      expect(page).to have_content('Balance')
      expect(page).to have_content('Password')
      expect(page).to have_button('Submit')
    end

    it 'allows a parent to add an account for your kid' do
      sign_up
      sign_in
      click_link 'Add an account for your kid'
      fill_in('kid[name]', with: 'timmy')
      fill_in('kid[username]', with: 'timmy')
      fill_in('kid[balance]', with: '10')
      fill_in('kid[password]', with: 'timmy')
      click_button('Submit')
      expect(page).to have_content("You've created a new account for timmy")
    end

    it 'will not save a kid to the database if there are empty fields in the registration form' do
      sign_up
      sign_in
      click_link 'Add an account for your kid'
      fill_in('kid[name]', with: 'timmy')
      fill_in('kid[username]', with: '')
      fill_in('kid[balance]', with: '10')
      fill_in('kid[password]', with: 'timmy')
      click_button('Submit')
      expect(page).to have_content("Username can't be blank")
    end

    it 'checks to ensure that the user is registering with a unique password' do
      sign_up
      sign_in
      click_link 'Add an account for your kid'
      fill_in('kid[name]', with: 'timmy')
      fill_in('kid[username]', with: 'timmy')
      fill_in('kid[balance]', with: '10')
      fill_in('kid[password]', with: 'timmy')
      click_button('Submit')
      click_link 'Add an account for your kid'
      fill_in('kid[name]', with: 'timmy')
      fill_in('kid[username]', with: 'timmy')
      fill_in('kid[balance]', with: '10')
      fill_in('kid[password]', with: 'timmy')
      click_button('Submit')
      expect(page).to have_content('Username has already been taken')
    end

  end

end
