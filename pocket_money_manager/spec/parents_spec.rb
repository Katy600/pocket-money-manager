require "rails_helper"

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
  end
end
