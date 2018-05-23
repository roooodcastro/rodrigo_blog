RSpec.describe User do
  subject { user }

  let(:user) { FactoryBot.build :user }

  it { is_expected.to be_valid }

  describe 'Associations' do
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :articles }
  end
end
