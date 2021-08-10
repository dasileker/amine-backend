require 'rails_helper'

RSpec.describe User, type: :model do
  it 'expect user to be invalid without any details' do
    expect(User.new).to_not be_valid
  end

  it 'expect user to be invalid without name' do
    expect(User.create(email: 'abcd@mail.com', password: '12345')).to_not be_valid
  end

  it 'expect user to be valid with all parameters' do
    expect(User.create(name: 'John', email: 'abcd@mail.com', password: '12345')).to be_valid
  end
  describe 'associations' do
    it { should have_many(:appointments) }
    it { should have_many(:doctors) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
