describe 'Create item', type: :feature do
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
    visit '/cakes/new'
    fill_in 'Name', with: 'item_name'
    fill_in 'Amount', with: 2
    click_button 'Create Cake'
    expect(page).to have_content('Item created successfully!')
  end
  it 'require fields filled up' do
    visit '/cakes/new'
    fill_in 'Name', with: ''
    fill_in 'Amount', with: ''
    click_button 'Create Cake'
    expect(page).to have_content 'Please fill required fields!'
  end
end
