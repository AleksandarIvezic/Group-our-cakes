describe 'Sign in', type: :feature do
  before :each do
    @user = User.create(name: 'username', password: 'password', avatar: 'app/helpers/test_helper/img_avatar.png')
  end
  after :each do
    @user.destroy
  end

  it 'sign in user' do
    visit '/login'
    fill_in 'Name', with: 'username'
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page).to have_content('Logged in!')
  end
  it "doesn't sign in unregistered user" do
    visit '/login'
    fill_in 'Name', with: 'wrong_username'
    fill_in 'Password', with: 'wrong_password'
    click_button 'Login'
    expect(page).to have_content 'Name or password is invalid'
  end
end
