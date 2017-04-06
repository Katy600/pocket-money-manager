def sign_up
  visit('/parents/new')
  fill_in('parent[first_name]', with: 'Spongebob')
  fill_in('parent[last_name]', with: 'Squarepants')
  fill_in('parent[email]', with: 'bob@bob.com')
  fill_in('parent[password]', with: 'bob123')
  click_button('Submit')
end
