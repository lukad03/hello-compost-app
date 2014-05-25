require 'spec_helper'

feature 'Registration' do

  pending 'User views sign up page and creates an account' do
    location = FactoryGirl.create( :location, name: 'Amboy' )

    visit root_path
    click_link 'Sign Up'

    fill_in 'Username', with: 'user1'
    fill_in 'Password', with: 'password'
    select 'Amboy', from: 'Location'

    click_button 'Sign up'

  end

end
