require 'rails_helper'
require 'spec_helper'



  def select_option(css_selector, value)
    find(:css, css_selector).find(:option, value).select_option
  end

feature 'create goal' do
    
    background :each do
        subject(:user) {User.new(username: 'charlos')}

    
        user.password = 'password'
        user.save! 
        
        visit new_session_path
        fill_in 'Username', with: 'charlos'
        fill_in 'Password', with: 'password'

        click_button 'sign in!'
    
        visit new_goal_path
    end

    scenario 'new form creates goal and redirects to user show page' do
        fill_in 'Title', with: 'Sample Goal'
        fill_in 'Body', with: 'Do stuff'
        select_option('#private', :true)

        click_button 'Create Goal'

        expect(page).to have_content('Do stuff')
        expect(current_path).to eq(user_url(user))
    end

end