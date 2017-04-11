def sign_in
  fill_in('email', with: 'bob@bob.com')
  fill_in('password', with: 'bob123')
  click_button('Log In')
end
