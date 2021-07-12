require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:cakes) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:icon) }
  end
end