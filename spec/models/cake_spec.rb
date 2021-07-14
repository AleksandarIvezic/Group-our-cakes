require 'rails_helper'

RSpec.describe Cake, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:groups) }
    it { should belong_to(:author) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end
end
