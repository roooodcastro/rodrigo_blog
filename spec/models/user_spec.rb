RSpec.describe User do
  subject { user }

  let(:user) { FactoryBot.build :user }

  it { is_expected.to be_valid }
end
