describe 'Sign up', type: :feature do
    
  
    it 'new user' do
      visit '/signup'
      fill_in 'Name', with: 'username'
      fill_in 'Password', with: 'password'
      attach_file('Avatar', 'app/helpers/test_helper/img_avatar.png')
      click_button 'Confirm'
      expect(page).to have_content('Login')
    end
    it "doesn't sign up if user already exist" do
      visit '/signup'
      fill_in 'Name', with: 'username'
      fill_in 'Password', with:
       'password'
      attach_file('Avatar', 'app/helpers/test_helper/img_avatar.png')
      click_button 'Confirm'
      expect(page).to have_content '1 error prohibited this user from being saved:'
    end
  end