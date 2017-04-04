require "rails_helper"

feature 'User can sign in' do
  context 'User is not signed in' do
    it 'should diplay a sign up button' do
      visit '/parents'
      expect(page).to have_link('Sign up')
    end
  end
end
