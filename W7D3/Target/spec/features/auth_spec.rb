require 'rails_helper'
require 'spec_helper'

feature 'sign up' do
    background :each do
        visit new_user_path
    end

    scenario 'signs up a new user with valid credentials' do
        fill_in 'Username', with: 'bob'
        fill_in 'Password', with: '123456'

        click_button 'create'

        expect(page).to have_content('bob')
    end
end

feature 'logging in' do 
    subject(:user) {User.new(username: 'charlos')}

    background :each do
        user.password = 'password'
        user.save! 
        visit new_session_path 
    end

    scenario "shows username after login" do 
     

        fill_in 'Username', with: 'charlos'
        fill_in 'Password', with: 'password'

        click_button 'sign in!'

        expect(page).to have_content('charlos') 
        user = User.find_by(username: 'charlos')
        expect(current_path).to eq(user_path(user))

    end
end

feature 'logging out' do 
    subject(:user) {User.new(username: 'charlos')}

    background :each do
        user.password = 'password'
        user.save! 
        
        visit new_session_path
        fill_in 'Username', with: 'charlos'
        fill_in 'Password', with: 'password'

        click_button 'sign in!'
    end

    scenario "doesn't show username after logout" do
        click_button "Logout"
        expect(page).to_not have_content("charlos")
        expect(current_path).to eq(new_session_path) 
    end

end