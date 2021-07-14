describe 'Create category', type: :feature do
  before :each do
    @user = User.create(name: 'username', password: 'password', avatar: 'app/helpers/test_helper/img_avatar.png')
    visit '/login'
    fill_in 'Name', with: 'username'
    fill_in 'Password', with: 'password'
    click_button 'Login'
  end
  after :each do
    @user.destroy
  end

  it 'Create new item' do
    visit '/groups/new'
    fill_in 'Name', with: 'group_name'
    attach_file('Icon', 'app/helpers/test_helper/img_avatar.png')
    click_button 'Create Group'
    expect(page).to have_content('Category created successfully!')
  end
  it 'Require fields filled up' do
    visit '/groups/new'
    fill_in 'Name', with: ''
    attach_file('Icon', 'app/helpers/test_helper/img_avatar.png')
    click_button 'Create Group'
    expect(page).to have_content 'Please fill required fields!'
  end
end
